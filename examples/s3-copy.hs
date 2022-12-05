{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Lens
import Data.Aeson (Value (Array), object)
import qualified Data.ByteString.Lazy.Char8 as B
import Data.Text (Text)
import Stratosphere

main :: IO ()
main = B.putStrLn $ encodeTemplate myTemplate

myTemplate :: Template
myTemplate =
  template
  [ role'
  , lambda
  , permission
  , incomingS3Bucket
  , outgoingS3Bucket
  ]
  & templateDescription ?~ "Simple event triggered S3 bucket to bucket copy example"
  & templateFormatVersion ?~ "2010-09-09"

lambda :: Resource
lambda = (
  resource "CopyS3ObjectLambda" $
  lambdaFunction
    lambdaCode
    "index.handler"
    (GetAtt "IAMRole" "Arn")
    (Literal NodeJS14x)
    & lfFunctionName ?~ "copyS3Object"
  )
  & resourceDependsOn ?~ [ role' ^. resourceName ]

  where
    lambdaCode :: LambdaFunctionCode
    lambdaCode = lambdaFunctionCode
      & lfcZipFile ?~ code

    code :: Val Text
    code = "\
    \ var AWS = require('aws-sdk'); \
    \ var s3 = new AWS.S3({apiVersion: '2006-03-01'}); \
    \ exports.handler = function(event, context, callback) { \
    \  console.log(JSON.stringify(event)); \
    \  var rec = event.Records[0]; \
    \  var bucket = rec.s3.bucket.name; \
    \  var key = rec.s3.object.key; \
    \  s3.copyObject({Bucket: \"stratosphere-s3-copy-outgoing\", Key: key, CopySource: \"stratosphere-s3-copy-incoming/\"+key}, function(err){ \
    \    callback(null, \"copied s3 object\"); \
    \  }); \
    \ } \
    \ "

role' :: Resource
role' =
  resource "IAMRole" $
  iamRole
  rolePolicyDocumentObject
  & iamrPolicies ?~ [ executePolicy ]
  & iamrRoleName ?~ "MyLambdaBasicExecutionRole"
  & iamrPath ?~ "/"

  where
    executePolicy =
      iamRolePolicy
      [ ("Version", "2012-10-17")
      , ("Statement", statement)
      ]
      "MyLambdaExecutionPolicy"

      where
        statement = object
          [ ("Effect", "Allow")
          , ("Action", actions)
          , ("Resource", "*")
          ]

        actions = Array
          [ "logs:CreateLogGroup"
          , "logs:CreateLogStream"
          , "logs:PutLogEvents"

          , "s3:PutObject"
          , "s3:GetObject"
          ]

    rolePolicyDocumentObject =
      [ ("Version", "2012-10-17")
      , ("Statement", statement)
      ]

      where
        statement = object
          [ ("Effect", "Allow")
          , ("Principal", principal)
          , ("Action", "sts:AssumeRole")
          ]

        principal = object
          [ ("Service", "lambda.amazonaws.com") ]

incomingS3Bucket :: Resource
incomingS3Bucket = (
  resource "IncomingBucket" $
  s3Bucket
  & sbBucketName ?~ "stratosphere-s3-copy-incoming"
  & sbNotificationConfiguration ?~ config
  )
  & resourceDependsOn ?~ [ lambda ^. resourceName ]

  where
    config =
      s3BucketNotificationConfiguration
      & sbncLambdaConfigurations ?~ [lambdaConfig]

    lambdaConfig =
      s3BucketLambdaConfiguration
      "s3:ObjectCreated:*"
      (GetAtt "CopyS3ObjectLambda" "Arn")

outgoingS3Bucket :: Resource
outgoingS3Bucket =
  resource "OutgoingBucket" $
  s3Bucket
  & sbBucketName ?~ "stratosphere-s3-copy-outgoing"

permission :: Resource
permission = resource "LambdaPermission" $
  lambdaPermission
    "lambda:*"
    (GetAtt "CopyS3ObjectLambda" "Arn")
    "s3.amazonaws.com"
