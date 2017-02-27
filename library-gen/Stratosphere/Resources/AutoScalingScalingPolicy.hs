{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-policy.html

module Stratosphere.Resources.AutoScalingScalingPolicy where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.AutoScalingScalingPolicyStepAdjustment

-- | Full data type definition for AutoScalingScalingPolicy. See
-- | 'autoScalingScalingPolicy' for a more convenient constructor.
data AutoScalingScalingPolicy =
  AutoScalingScalingPolicy
  { _autoScalingScalingPolicyAdjustmentType :: Val Text
  , _autoScalingScalingPolicyAutoScalingGroupName :: Val Text
  , _autoScalingScalingPolicyCooldown :: Maybe (Val Text)
  , _autoScalingScalingPolicyEstimatedInstanceWarmup :: Maybe (Val Integer')
  , _autoScalingScalingPolicyMetricAggregationType :: Maybe (Val Text)
  , _autoScalingScalingPolicyMinAdjustmentMagnitude :: Maybe (Val Integer')
  , _autoScalingScalingPolicyPolicyType :: Maybe (Val Text)
  , _autoScalingScalingPolicyScalingAdjustment :: Maybe (Val Integer')
  , _autoScalingScalingPolicyStepAdjustments :: Maybe [AutoScalingScalingPolicyStepAdjustment]
  } deriving (Show, Eq)

instance ToJSON AutoScalingScalingPolicy where
  toJSON AutoScalingScalingPolicy{..} =
    object $
    catMaybes
    [ Just ("AdjustmentType" .= _autoScalingScalingPolicyAdjustmentType)
    , Just ("AutoScalingGroupName" .= _autoScalingScalingPolicyAutoScalingGroupName)
    , ("Cooldown" .=) <$> _autoScalingScalingPolicyCooldown
    , ("EstimatedInstanceWarmup" .=) <$> _autoScalingScalingPolicyEstimatedInstanceWarmup
    , ("MetricAggregationType" .=) <$> _autoScalingScalingPolicyMetricAggregationType
    , ("MinAdjustmentMagnitude" .=) <$> _autoScalingScalingPolicyMinAdjustmentMagnitude
    , ("PolicyType" .=) <$> _autoScalingScalingPolicyPolicyType
    , ("ScalingAdjustment" .=) <$> _autoScalingScalingPolicyScalingAdjustment
    , ("StepAdjustments" .=) <$> _autoScalingScalingPolicyStepAdjustments
    ]

instance FromJSON AutoScalingScalingPolicy where
  parseJSON (Object obj) =
    AutoScalingScalingPolicy <$>
      obj .: "AdjustmentType" <*>
      obj .: "AutoScalingGroupName" <*>
      obj .:? "Cooldown" <*>
      obj .:? "EstimatedInstanceWarmup" <*>
      obj .:? "MetricAggregationType" <*>
      obj .:? "MinAdjustmentMagnitude" <*>
      obj .:? "PolicyType" <*>
      obj .:? "ScalingAdjustment" <*>
      obj .:? "StepAdjustments"
  parseJSON _ = mempty

-- | Constructor for 'AutoScalingScalingPolicy' containing required fields as
-- | arguments.
autoScalingScalingPolicy
  :: Val Text -- ^ 'asspAdjustmentType'
  -> Val Text -- ^ 'asspAutoScalingGroupName'
  -> AutoScalingScalingPolicy
autoScalingScalingPolicy adjustmentTypearg autoScalingGroupNamearg =
  AutoScalingScalingPolicy
  { _autoScalingScalingPolicyAdjustmentType = adjustmentTypearg
  , _autoScalingScalingPolicyAutoScalingGroupName = autoScalingGroupNamearg
  , _autoScalingScalingPolicyCooldown = Nothing
  , _autoScalingScalingPolicyEstimatedInstanceWarmup = Nothing
  , _autoScalingScalingPolicyMetricAggregationType = Nothing
  , _autoScalingScalingPolicyMinAdjustmentMagnitude = Nothing
  , _autoScalingScalingPolicyPolicyType = Nothing
  , _autoScalingScalingPolicyScalingAdjustment = Nothing
  , _autoScalingScalingPolicyStepAdjustments = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-policy.html#cfn-as-scalingpolicy-adjustmenttype
asspAdjustmentType :: Lens' AutoScalingScalingPolicy (Val Text)
asspAdjustmentType = lens _autoScalingScalingPolicyAdjustmentType (\s a -> s { _autoScalingScalingPolicyAdjustmentType = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-policy.html#cfn-as-scalingpolicy-autoscalinggroupname
asspAutoScalingGroupName :: Lens' AutoScalingScalingPolicy (Val Text)
asspAutoScalingGroupName = lens _autoScalingScalingPolicyAutoScalingGroupName (\s a -> s { _autoScalingScalingPolicyAutoScalingGroupName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-policy.html#cfn-as-scalingpolicy-cooldown
asspCooldown :: Lens' AutoScalingScalingPolicy (Maybe (Val Text))
asspCooldown = lens _autoScalingScalingPolicyCooldown (\s a -> s { _autoScalingScalingPolicyCooldown = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-policy.html#cfn-as-scalingpolicy-estimatedinstancewarmup
asspEstimatedInstanceWarmup :: Lens' AutoScalingScalingPolicy (Maybe (Val Integer'))
asspEstimatedInstanceWarmup = lens _autoScalingScalingPolicyEstimatedInstanceWarmup (\s a -> s { _autoScalingScalingPolicyEstimatedInstanceWarmup = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-policy.html#cfn-as-scalingpolicy-metricaggregationtype
asspMetricAggregationType :: Lens' AutoScalingScalingPolicy (Maybe (Val Text))
asspMetricAggregationType = lens _autoScalingScalingPolicyMetricAggregationType (\s a -> s { _autoScalingScalingPolicyMetricAggregationType = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-policy.html#cfn-as-scalingpolicy-minadjustmentmagnitude
asspMinAdjustmentMagnitude :: Lens' AutoScalingScalingPolicy (Maybe (Val Integer'))
asspMinAdjustmentMagnitude = lens _autoScalingScalingPolicyMinAdjustmentMagnitude (\s a -> s { _autoScalingScalingPolicyMinAdjustmentMagnitude = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-policy.html#cfn-as-scalingpolicy-policytype
asspPolicyType :: Lens' AutoScalingScalingPolicy (Maybe (Val Text))
asspPolicyType = lens _autoScalingScalingPolicyPolicyType (\s a -> s { _autoScalingScalingPolicyPolicyType = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-policy.html#cfn-as-scalingpolicy-scalingadjustment
asspScalingAdjustment :: Lens' AutoScalingScalingPolicy (Maybe (Val Integer'))
asspScalingAdjustment = lens _autoScalingScalingPolicyScalingAdjustment (\s a -> s { _autoScalingScalingPolicyScalingAdjustment = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-as-policy.html#cfn-as-scalingpolicy-stepadjustments
asspStepAdjustments :: Lens' AutoScalingScalingPolicy (Maybe [AutoScalingScalingPolicyStepAdjustment])
asspStepAdjustments = lens _autoScalingScalingPolicyStepAdjustments (\s a -> s { _autoScalingScalingPolicyStepAdjustments = a })