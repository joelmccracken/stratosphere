{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-codedeploy-deploymentgroup.html

module Stratosphere.Resources.CodeDeployDeploymentGroup where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.CodeDeployDeploymentGroupDeployment
import Stratosphere.ResourceProperties.CodeDeployDeploymentGroupEc2TagFilter
import Stratosphere.ResourceProperties.CodeDeployDeploymentGroupOnPremisesInstanceTagFilter

-- | Full data type definition for CodeDeployDeploymentGroup. See
-- | 'codeDeployDeploymentGroup' for a more convenient constructor.
data CodeDeployDeploymentGroup =
  CodeDeployDeploymentGroup
  { _codeDeployDeploymentGroupApplicationName :: Val Text
  , _codeDeployDeploymentGroupAutoScalingGroups :: Maybe [Val Text]
  , _codeDeployDeploymentGroupDeployment :: Maybe CodeDeployDeploymentGroupDeployment
  , _codeDeployDeploymentGroupDeploymentConfigName :: Maybe (Val Text)
  , _codeDeployDeploymentGroupDeploymentGroupName :: Maybe (Val Text)
  , _codeDeployDeploymentGroupEc2TagFilters :: Maybe [CodeDeployDeploymentGroupEc2TagFilter]
  , _codeDeployDeploymentGroupOnPremisesInstanceTagFilters :: Maybe [CodeDeployDeploymentGroupOnPremisesInstanceTagFilter]
  , _codeDeployDeploymentGroupServiceRoleArn :: Val Text
  } deriving (Show, Eq)

instance ToJSON CodeDeployDeploymentGroup where
  toJSON CodeDeployDeploymentGroup{..} =
    object $
    catMaybes
    [ Just ("ApplicationName" .= _codeDeployDeploymentGroupApplicationName)
    , ("AutoScalingGroups" .=) <$> _codeDeployDeploymentGroupAutoScalingGroups
    , ("Deployment" .=) <$> _codeDeployDeploymentGroupDeployment
    , ("DeploymentConfigName" .=) <$> _codeDeployDeploymentGroupDeploymentConfigName
    , ("DeploymentGroupName" .=) <$> _codeDeployDeploymentGroupDeploymentGroupName
    , ("Ec2TagFilters" .=) <$> _codeDeployDeploymentGroupEc2TagFilters
    , ("OnPremisesInstanceTagFilters" .=) <$> _codeDeployDeploymentGroupOnPremisesInstanceTagFilters
    , Just ("ServiceRoleArn" .= _codeDeployDeploymentGroupServiceRoleArn)
    ]

instance FromJSON CodeDeployDeploymentGroup where
  parseJSON (Object obj) =
    CodeDeployDeploymentGroup <$>
      obj .: "ApplicationName" <*>
      obj .:? "AutoScalingGroups" <*>
      obj .:? "Deployment" <*>
      obj .:? "DeploymentConfigName" <*>
      obj .:? "DeploymentGroupName" <*>
      obj .:? "Ec2TagFilters" <*>
      obj .:? "OnPremisesInstanceTagFilters" <*>
      obj .: "ServiceRoleArn"
  parseJSON _ = mempty

-- | Constructor for 'CodeDeployDeploymentGroup' containing required fields as
-- | arguments.
codeDeployDeploymentGroup
  :: Val Text -- ^ 'cddgApplicationName'
  -> Val Text -- ^ 'cddgServiceRoleArn'
  -> CodeDeployDeploymentGroup
codeDeployDeploymentGroup applicationNamearg serviceRoleArnarg =
  CodeDeployDeploymentGroup
  { _codeDeployDeploymentGroupApplicationName = applicationNamearg
  , _codeDeployDeploymentGroupAutoScalingGroups = Nothing
  , _codeDeployDeploymentGroupDeployment = Nothing
  , _codeDeployDeploymentGroupDeploymentConfigName = Nothing
  , _codeDeployDeploymentGroupDeploymentGroupName = Nothing
  , _codeDeployDeploymentGroupEc2TagFilters = Nothing
  , _codeDeployDeploymentGroupOnPremisesInstanceTagFilters = Nothing
  , _codeDeployDeploymentGroupServiceRoleArn = serviceRoleArnarg
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-codedeploy-deploymentgroup.html#cfn-codedeploy-deploymentgroup-applicationname
cddgApplicationName :: Lens' CodeDeployDeploymentGroup (Val Text)
cddgApplicationName = lens _codeDeployDeploymentGroupApplicationName (\s a -> s { _codeDeployDeploymentGroupApplicationName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-codedeploy-deploymentgroup.html#cfn-codedeploy-deploymentgroup-autoscalinggroups
cddgAutoScalingGroups :: Lens' CodeDeployDeploymentGroup (Maybe [Val Text])
cddgAutoScalingGroups = lens _codeDeployDeploymentGroupAutoScalingGroups (\s a -> s { _codeDeployDeploymentGroupAutoScalingGroups = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-codedeploy-deploymentgroup.html#cfn-codedeploy-deploymentgroup-deployment
cddgDeployment :: Lens' CodeDeployDeploymentGroup (Maybe CodeDeployDeploymentGroupDeployment)
cddgDeployment = lens _codeDeployDeploymentGroupDeployment (\s a -> s { _codeDeployDeploymentGroupDeployment = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-codedeploy-deploymentgroup.html#cfn-codedeploy-deploymentgroup-deploymentconfigname
cddgDeploymentConfigName :: Lens' CodeDeployDeploymentGroup (Maybe (Val Text))
cddgDeploymentConfigName = lens _codeDeployDeploymentGroupDeploymentConfigName (\s a -> s { _codeDeployDeploymentGroupDeploymentConfigName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-codedeploy-deploymentgroup.html#cfn-codedeploy-deploymentgroup-deploymentgroupname
cddgDeploymentGroupName :: Lens' CodeDeployDeploymentGroup (Maybe (Val Text))
cddgDeploymentGroupName = lens _codeDeployDeploymentGroupDeploymentGroupName (\s a -> s { _codeDeployDeploymentGroupDeploymentGroupName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-codedeploy-deploymentgroup.html#cfn-codedeploy-deploymentgroup-ec2tagfilters
cddgEc2TagFilters :: Lens' CodeDeployDeploymentGroup (Maybe [CodeDeployDeploymentGroupEc2TagFilter])
cddgEc2TagFilters = lens _codeDeployDeploymentGroupEc2TagFilters (\s a -> s { _codeDeployDeploymentGroupEc2TagFilters = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-codedeploy-deploymentgroup.html#cfn-codedeploy-deploymentgroup-onpremisesinstancetagfilters
cddgOnPremisesInstanceTagFilters :: Lens' CodeDeployDeploymentGroup (Maybe [CodeDeployDeploymentGroupOnPremisesInstanceTagFilter])
cddgOnPremisesInstanceTagFilters = lens _codeDeployDeploymentGroupOnPremisesInstanceTagFilters (\s a -> s { _codeDeployDeploymentGroupOnPremisesInstanceTagFilters = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-codedeploy-deploymentgroup.html#cfn-codedeploy-deploymentgroup-servicerolearn
cddgServiceRoleArn :: Lens' CodeDeployDeploymentGroup (Val Text)
cddgServiceRoleArn = lens _codeDeployDeploymentGroupServiceRoleArn (\s a -> s { _codeDeployDeploymentGroupServiceRoleArn = a })
