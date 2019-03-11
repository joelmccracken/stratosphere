{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TupleSections #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html

module Stratosphere.Resources.AppStreamFleet where

import Stratosphere.ResourceImports
import Stratosphere.ResourceProperties.AppStreamFleetComputeCapacity
import Stratosphere.ResourceProperties.AppStreamFleetDomainJoinInfo
import Stratosphere.ResourceProperties.AppStreamFleetVpcConfig

-- | Full data type definition for AppStreamFleet. See 'appStreamFleet' for a
-- more convenient constructor.
data AppStreamFleet =
  AppStreamFleet
  { _appStreamFleetComputeCapacity :: AppStreamFleetComputeCapacity
  , _appStreamFleetDescription :: Maybe (Val Text)
  , _appStreamFleetDisconnectTimeoutInSeconds :: Maybe (Val Integer)
  , _appStreamFleetDisplayName :: Maybe (Val Text)
  , _appStreamFleetDomainJoinInfo :: Maybe AppStreamFleetDomainJoinInfo
  , _appStreamFleetEnableDefaultInternetAccess :: Maybe (Val Bool)
  , _appStreamFleetFleetType :: Maybe (Val Text)
  , _appStreamFleetImageArn :: Maybe (Val Text)
  , _appStreamFleetImageName :: Maybe (Val Text)
  , _appStreamFleetInstanceType :: Val Text
  , _appStreamFleetMaxUserDurationInSeconds :: Maybe (Val Integer)
  , _appStreamFleetName :: Maybe (Val Text)
  , _appStreamFleetVpcConfig :: Maybe AppStreamFleetVpcConfig
  } deriving (Show, Eq)

instance ToJSON AppStreamFleet where
  toJSON AppStreamFleet{..} =
    object $
    catMaybes
    [ (Just . ("ComputeCapacity",) . toJSON) _appStreamFleetComputeCapacity
    , fmap (("Description",) . toJSON) _appStreamFleetDescription
    , fmap (("DisconnectTimeoutInSeconds",) . toJSON . fmap Integer') _appStreamFleetDisconnectTimeoutInSeconds
    , fmap (("DisplayName",) . toJSON) _appStreamFleetDisplayName
    , fmap (("DomainJoinInfo",) . toJSON) _appStreamFleetDomainJoinInfo
    , fmap (("EnableDefaultInternetAccess",) . toJSON . fmap Bool') _appStreamFleetEnableDefaultInternetAccess
    , fmap (("FleetType",) . toJSON) _appStreamFleetFleetType
    , fmap (("ImageArn",) . toJSON) _appStreamFleetImageArn
    , fmap (("ImageName",) . toJSON) _appStreamFleetImageName
    , (Just . ("InstanceType",) . toJSON) _appStreamFleetInstanceType
    , fmap (("MaxUserDurationInSeconds",) . toJSON . fmap Integer') _appStreamFleetMaxUserDurationInSeconds
    , fmap (("Name",) . toJSON) _appStreamFleetName
    , fmap (("VpcConfig",) . toJSON) _appStreamFleetVpcConfig
    ]

-- | Constructor for 'AppStreamFleet' containing required fields as arguments.
appStreamFleet
  :: AppStreamFleetComputeCapacity -- ^ 'asfComputeCapacity'
  -> Val Text -- ^ 'asfInstanceType'
  -> AppStreamFleet
appStreamFleet computeCapacityarg instanceTypearg =
  AppStreamFleet
  { _appStreamFleetComputeCapacity = computeCapacityarg
  , _appStreamFleetDescription = Nothing
  , _appStreamFleetDisconnectTimeoutInSeconds = Nothing
  , _appStreamFleetDisplayName = Nothing
  , _appStreamFleetDomainJoinInfo = Nothing
  , _appStreamFleetEnableDefaultInternetAccess = Nothing
  , _appStreamFleetFleetType = Nothing
  , _appStreamFleetImageArn = Nothing
  , _appStreamFleetImageName = Nothing
  , _appStreamFleetInstanceType = instanceTypearg
  , _appStreamFleetMaxUserDurationInSeconds = Nothing
  , _appStreamFleetName = Nothing
  , _appStreamFleetVpcConfig = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-computecapacity
asfComputeCapacity :: Lens' AppStreamFleet AppStreamFleetComputeCapacity
asfComputeCapacity = lens _appStreamFleetComputeCapacity (\s a -> s { _appStreamFleetComputeCapacity = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-description
asfDescription :: Lens' AppStreamFleet (Maybe (Val Text))
asfDescription = lens _appStreamFleetDescription (\s a -> s { _appStreamFleetDescription = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-disconnecttimeoutinseconds
asfDisconnectTimeoutInSeconds :: Lens' AppStreamFleet (Maybe (Val Integer))
asfDisconnectTimeoutInSeconds = lens _appStreamFleetDisconnectTimeoutInSeconds (\s a -> s { _appStreamFleetDisconnectTimeoutInSeconds = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-displayname
asfDisplayName :: Lens' AppStreamFleet (Maybe (Val Text))
asfDisplayName = lens _appStreamFleetDisplayName (\s a -> s { _appStreamFleetDisplayName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-domainjoininfo
asfDomainJoinInfo :: Lens' AppStreamFleet (Maybe AppStreamFleetDomainJoinInfo)
asfDomainJoinInfo = lens _appStreamFleetDomainJoinInfo (\s a -> s { _appStreamFleetDomainJoinInfo = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-enabledefaultinternetaccess
asfEnableDefaultInternetAccess :: Lens' AppStreamFleet (Maybe (Val Bool))
asfEnableDefaultInternetAccess = lens _appStreamFleetEnableDefaultInternetAccess (\s a -> s { _appStreamFleetEnableDefaultInternetAccess = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-fleettype
asfFleetType :: Lens' AppStreamFleet (Maybe (Val Text))
asfFleetType = lens _appStreamFleetFleetType (\s a -> s { _appStreamFleetFleetType = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-imagearn
asfImageArn :: Lens' AppStreamFleet (Maybe (Val Text))
asfImageArn = lens _appStreamFleetImageArn (\s a -> s { _appStreamFleetImageArn = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-imagename
asfImageName :: Lens' AppStreamFleet (Maybe (Val Text))
asfImageName = lens _appStreamFleetImageName (\s a -> s { _appStreamFleetImageName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-instancetype
asfInstanceType :: Lens' AppStreamFleet (Val Text)
asfInstanceType = lens _appStreamFleetInstanceType (\s a -> s { _appStreamFleetInstanceType = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-maxuserdurationinseconds
asfMaxUserDurationInSeconds :: Lens' AppStreamFleet (Maybe (Val Integer))
asfMaxUserDurationInSeconds = lens _appStreamFleetMaxUserDurationInSeconds (\s a -> s { _appStreamFleetMaxUserDurationInSeconds = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-name
asfName :: Lens' AppStreamFleet (Maybe (Val Text))
asfName = lens _appStreamFleetName (\s a -> s { _appStreamFleetName = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-appstream-fleet.html#cfn-appstream-fleet-vpcconfig
asfVpcConfig :: Lens' AppStreamFleet (Maybe AppStreamFleetVpcConfig)
asfVpcConfig = lens _appStreamFleetVpcConfig (\s a -> s { _appStreamFleetVpcConfig = a })
