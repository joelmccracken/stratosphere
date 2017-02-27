{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-clusterparametergroup.html

module Stratosphere.Resources.RedshiftClusterParameterGroup where

import Control.Lens hiding ((.=))
import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Monoid (mempty)
import Data.Text

import Stratosphere.Values
import Stratosphere.ResourceProperties.RedshiftClusterParameterGroupParameter

-- | Full data type definition for RedshiftClusterParameterGroup. See
-- | 'redshiftClusterParameterGroup' for a more convenient constructor.
data RedshiftClusterParameterGroup =
  RedshiftClusterParameterGroup
  { _redshiftClusterParameterGroupDescription :: Val Text
  , _redshiftClusterParameterGroupParameterGroupFamily :: Val Text
  , _redshiftClusterParameterGroupParameters :: Maybe [RedshiftClusterParameterGroupParameter]
  } deriving (Show, Eq)

instance ToJSON RedshiftClusterParameterGroup where
  toJSON RedshiftClusterParameterGroup{..} =
    object $
    catMaybes
    [ Just ("Description" .= _redshiftClusterParameterGroupDescription)
    , Just ("ParameterGroupFamily" .= _redshiftClusterParameterGroupParameterGroupFamily)
    , ("Parameters" .=) <$> _redshiftClusterParameterGroupParameters
    ]

instance FromJSON RedshiftClusterParameterGroup where
  parseJSON (Object obj) =
    RedshiftClusterParameterGroup <$>
      obj .: "Description" <*>
      obj .: "ParameterGroupFamily" <*>
      obj .:? "Parameters"
  parseJSON _ = mempty

-- | Constructor for 'RedshiftClusterParameterGroup' containing required
-- | fields as arguments.
redshiftClusterParameterGroup
  :: Val Text -- ^ 'rcpgDescription'
  -> Val Text -- ^ 'rcpgParameterGroupFamily'
  -> RedshiftClusterParameterGroup
redshiftClusterParameterGroup descriptionarg parameterGroupFamilyarg =
  RedshiftClusterParameterGroup
  { _redshiftClusterParameterGroupDescription = descriptionarg
  , _redshiftClusterParameterGroupParameterGroupFamily = parameterGroupFamilyarg
  , _redshiftClusterParameterGroupParameters = Nothing
  }

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-clusterparametergroup.html#cfn-redshift-clusterparametergroup-description
rcpgDescription :: Lens' RedshiftClusterParameterGroup (Val Text)
rcpgDescription = lens _redshiftClusterParameterGroupDescription (\s a -> s { _redshiftClusterParameterGroupDescription = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-clusterparametergroup.html#cfn-redshift-clusterparametergroup-parametergroupfamily
rcpgParameterGroupFamily :: Lens' RedshiftClusterParameterGroup (Val Text)
rcpgParameterGroupFamily = lens _redshiftClusterParameterGroupParameterGroupFamily (\s a -> s { _redshiftClusterParameterGroupParameterGroupFamily = a })

-- | http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-redshift-clusterparametergroup.html#cfn-redshift-clusterparametergroup-parameters
rcpgParameters :: Lens' RedshiftClusterParameterGroup (Maybe [RedshiftClusterParameterGroupParameter])
rcpgParameters = lens _redshiftClusterParameterGroupParameters (\s a -> s { _redshiftClusterParameterGroupParameters = a })