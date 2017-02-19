{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-config-deliverychannel.html

module Stratosphere.Resources.ConfigDeliveryChannel where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.ConfigDeliveryChannelConfigSnapshotDeliveryProperties

-- | Full data type definition for ConfigDeliveryChannel. See
-- | 'configDeliveryChannel' for a more convenient constructor.
data ConfigDeliveryChannel =
  ConfigDeliveryChannel
  { _configDeliveryChannelConfigSnapshotDeliveryProperties :: Maybe ConfigDeliveryChannelConfigSnapshotDeliveryProperties
  , _configDeliveryChannelName :: Maybe (Val Text)
  , _configDeliveryChannelS3BucketName :: Val Text
  , _configDeliveryChannelS3KeyPrefix :: Maybe (Val Text)
  , _configDeliveryChannelSnsTopicARN :: Maybe (Val Text)
  } deriving (Show, Eq)

instance ToJSON ConfigDeliveryChannel where
  toJSON ConfigDeliveryChannel{..} =
    object $
    catMaybes
    [ ("ConfigSnapshotDeliveryProperties" .=) <$> _configDeliveryChannelConfigSnapshotDeliveryProperties
    , ("Name" .=) <$> _configDeliveryChannelName
    , Just ("S3BucketName" .= _configDeliveryChannelS3BucketName)
    , ("S3KeyPrefix" .=) <$> _configDeliveryChannelS3KeyPrefix
    , ("SnsTopicARN" .=) <$> _configDeliveryChannelSnsTopicARN
    ]

instance FromJSON ConfigDeliveryChannel where
  parseJSON (Object obj) =
    ConfigDeliveryChannel <$>
      obj .:? "ConfigSnapshotDeliveryProperties" <*>
      obj .:? "Name" <*>
      obj .: "S3BucketName" <*>
      obj .:? "S3KeyPrefix" <*>
      obj .:? "SnsTopicARN"
  parseJSON _ = mempty

-- | Constructor for 'ConfigDeliveryChannel' containing required fields as
-- | arguments.
configDeliveryChannel
  :: Val Text -- ^ 'cdcS3BucketName'
  -> ConfigDeliveryChannel
configDeliveryChannel s3BucketNamearg =
  ConfigDeliveryChannel
  { _configDeliveryChannelConfigSnapshotDeliveryProperties = Nothing
  , _configDeliveryChannelName = Nothing
  , _configDeliveryChannelS3BucketName = s3BucketNamearg
  , _configDeliveryChannelS3KeyPrefix = Nothing
  , _configDeliveryChannelSnsTopicARN = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-config-deliverychannel.html#cfn-config-deliverychannel-configsnapshotdeliveryproperties
cdcConfigSnapshotDeliveryProperties :: Lens' ConfigDeliveryChannel (Maybe ConfigDeliveryChannelConfigSnapshotDeliveryProperties)
cdcConfigSnapshotDeliveryProperties = lens _configDeliveryChannelConfigSnapshotDeliveryProperties (\s a -> s { _configDeliveryChannelConfigSnapshotDeliveryProperties = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-config-deliverychannel.html#cfn-config-deliverychannel-name
cdcName :: Lens' ConfigDeliveryChannel (Maybe (Val Text))
cdcName = lens _configDeliveryChannelName (\s a -> s { _configDeliveryChannelName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-config-deliverychannel.html#cfn-config-deliverychannel-s3bucketname
cdcS3BucketName :: Lens' ConfigDeliveryChannel (Val Text)
cdcS3BucketName = lens _configDeliveryChannelS3BucketName (\s a -> s { _configDeliveryChannelS3BucketName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-config-deliverychannel.html#cfn-config-deliverychannel-s3keyprefix
cdcS3KeyPrefix :: Lens' ConfigDeliveryChannel (Maybe (Val Text))
cdcS3KeyPrefix = lens _configDeliveryChannelS3KeyPrefix (\s a -> s { _configDeliveryChannelS3KeyPrefix = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-config-deliverychannel.html#cfn-config-deliverychannel-snstopicarn
cdcSnsTopicARN :: Lens' ConfigDeliveryChannel (Maybe (Val Text))
cdcSnsTopicARN = lens _configDeliveryChannelSnsTopicARN (\s a -> s { _configDeliveryChannelSnsTopicARN = a })
