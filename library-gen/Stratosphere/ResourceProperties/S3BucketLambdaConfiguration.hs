{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-bucket-notificationconfig-lambdaconfig.html

module Stratosphere.ResourceProperties.S3BucketLambdaConfiguration where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.S3BucketNotificationFilter

-- | Full data type definition for S3BucketLambdaConfiguration. See
-- | 's3BucketLambdaConfiguration' for a more convenient constructor.
data S3BucketLambdaConfiguration =
  S3BucketLambdaConfiguration
  { _s3BucketLambdaConfigurationEvent :: Val Text
  , _s3BucketLambdaConfigurationFilter :: Maybe S3BucketNotificationFilter
  , _s3BucketLambdaConfigurationFunction :: Val Text
  } deriving (Show, Eq)

instance ToJSON S3BucketLambdaConfiguration where
  toJSON S3BucketLambdaConfiguration{..} =
    object $
    catMaybes
    [ Just ("Event" .= _s3BucketLambdaConfigurationEvent)
    , ("Filter" .=) <$> _s3BucketLambdaConfigurationFilter
    , Just ("Function" .= _s3BucketLambdaConfigurationFunction)
    ]

instance FromJSON S3BucketLambdaConfiguration where
  parseJSON (Object obj) =
    S3BucketLambdaConfiguration <$>
      obj .: "Event" <*>
      obj .:? "Filter" <*>
      obj .: "Function"
  parseJSON _ = mempty

-- | Constructor for 'S3BucketLambdaConfiguration' containing required fields
-- | as arguments.
s3BucketLambdaConfiguration
  :: Val Text -- ^ 'sblcEvent'
  -> Val Text -- ^ 'sblcFunction'
  -> S3BucketLambdaConfiguration
s3BucketLambdaConfiguration eventarg functionarg =
  S3BucketLambdaConfiguration
  { _s3BucketLambdaConfigurationEvent = eventarg
  , _s3BucketLambdaConfigurationFilter = Nothing
  , _s3BucketLambdaConfigurationFunction = functionarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-bucket-notificationconfig-lambdaconfig.html#cfn-s3-bucket-notificationconfig-lambdaconfig-event
sblcEvent :: Lens' S3BucketLambdaConfiguration (Val Text)
sblcEvent = lens _s3BucketLambdaConfigurationEvent (\s a -> s { _s3BucketLambdaConfigurationEvent = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-bucket-notificationconfig-lambdaconfig.html#cfn-s3-bucket-notificationconfig-lambdaconfig-filter
sblcFilter :: Lens' S3BucketLambdaConfiguration (Maybe S3BucketNotificationFilter)
sblcFilter = lens _s3BucketLambdaConfigurationFilter (\s a -> s { _s3BucketLambdaConfigurationFilter = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-bucket-notificationconfig-lambdaconfig.html#cfn-s3-bucket-notificationconfig-lambdaconfig-function
sblcFunction :: Lens' S3BucketLambdaConfiguration (Val Text)
sblcFunction = lens _s3BucketLambdaConfigurationFunction (\s a -> s { _s3BucketLambdaConfigurationFunction = a })