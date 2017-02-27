{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-emr-cluster-configuration.html

module Stratosphere.ResourceProperties.EMRInstanceGroupConfigConfiguration where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values


-- | Full data type definition for EMRInstanceGroupConfigConfiguration. See
-- | 'emrInstanceGroupConfigConfiguration' for a more convenient constructor.
data EMRInstanceGroupConfigConfiguration =
  EMRInstanceGroupConfigConfiguration
  { _eMRInstanceGroupConfigConfigurationClassification :: Maybe (Val Text)
  , _eMRInstanceGroupConfigConfigurationConfigurationProperties :: Maybe Object
  , _eMRInstanceGroupConfigConfigurationConfigurations :: Maybe [EMRInstanceGroupConfigConfiguration]
  } deriving (Show, Eq)

instance ToJSON EMRInstanceGroupConfigConfiguration where
  toJSON EMRInstanceGroupConfigConfiguration{..} =
    object $
    catMaybes
    [ ("Classification" .=) <$> _eMRInstanceGroupConfigConfigurationClassification
    , ("ConfigurationProperties" .=) <$> _eMRInstanceGroupConfigConfigurationConfigurationProperties
    , ("Configurations" .=) <$> _eMRInstanceGroupConfigConfigurationConfigurations
    ]

instance FromJSON EMRInstanceGroupConfigConfiguration where
  parseJSON (Object obj) =
    EMRInstanceGroupConfigConfiguration <$>
      obj .:? "Classification" <*>
      obj .:? "ConfigurationProperties" <*>
      obj .:? "Configurations"
  parseJSON _ = mempty

-- | Constructor for 'EMRInstanceGroupConfigConfiguration' containing required
-- | fields as arguments.
emrInstanceGroupConfigConfiguration
  :: EMRInstanceGroupConfigConfiguration
emrInstanceGroupConfigConfiguration  =
  EMRInstanceGroupConfigConfiguration
  { _eMRInstanceGroupConfigConfigurationClassification = Nothing
  , _eMRInstanceGroupConfigConfigurationConfigurationProperties = Nothing
  , _eMRInstanceGroupConfigConfigurationConfigurations = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-emr-cluster-configuration.html#cfn-emr-cluster-configuration-classification
emrigccClassification :: Lens' EMRInstanceGroupConfigConfiguration (Maybe (Val Text))
emrigccClassification = lens _eMRInstanceGroupConfigConfigurationClassification (\s a -> s { _eMRInstanceGroupConfigConfigurationClassification = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-emr-cluster-configuration.html#cfn-emr-cluster-configuration-configurationproperties
emrigccConfigurationProperties :: Lens' EMRInstanceGroupConfigConfiguration (Maybe Object)
emrigccConfigurationProperties = lens _eMRInstanceGroupConfigConfigurationConfigurationProperties (\s a -> s { _eMRInstanceGroupConfigConfigurationConfigurationProperties = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-emr-cluster-configuration.html#cfn-emr-cluster-configuration-configurations
emrigccConfigurations :: Lens' EMRInstanceGroupConfigConfiguration (Maybe [EMRInstanceGroupConfigConfiguration])
emrigccConfigurations = lens _eMRInstanceGroupConfigConfigurationConfigurations (\s a -> s { _eMRInstanceGroupConfigConfigurationConfigurations = a })