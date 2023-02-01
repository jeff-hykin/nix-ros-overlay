
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, costmap-2d, dynamic-reconfigure, geometry-msgs, laser-geometry, message-filters, message-generation, openexr, openvdb, pcl-conversions, pcl-ros, pluginlib, roscpp, sensor-msgs, std-msgs, tbb, tf2-geometry-msgs, tf2-ros, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-spatio-temporal-voxel-layer";
  version = "1.3.5-r2";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "SteveMacenski";
        repo = "spatio_temporal_voxel_layer-release";
        rev = "release/melodic/spatio_temporal_voxel_layer/1.3.5-2";
        sha256 = "sha256-OVS6L/lwFv8hVPoonk+ruWFYk0hHa61ERfTBxtuiVys=";
      };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ costmap-2d dynamic-reconfigure geometry-msgs laser-geometry message-filters openexr openvdb pcl-conversions pcl-ros pluginlib roscpp sensor-msgs std-msgs tbb tf2-geometry-msgs tf2-ros visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The spatio-temporal 3D obstacle costmap package'';
    license = with lib.licenses; [ "LGPL-2.1-only" ];
  };
}
