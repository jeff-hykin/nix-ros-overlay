
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, laser-geometry, message-filters, nodelet, roscpp, roslint, sensor-msgs, tf2, tf2-ros, tf2-sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-pointcloud-to-laserscan";
  version = "1.4.1-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "ros-gbp";
        repo = "pointcloud_to_laserscan-release";
        rev = "release/melodic/pointcloud_to_laserscan/1.4.1-1";
        sha256 = "sha256-nbLSYZaMRpvQ4Jp9vmiZXIq+J8Rjjh68l09lpekS/lM=";
      };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint ];
  propagatedBuildInputs = [ laser-geometry message-filters nodelet roscpp sensor-msgs tf2 tf2-ros tf2-sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Converts a 3D Point Cloud into a 2D laser scan. This is useful for making devices like the Kinect appear like a laser scanner for 2D-based algorithms (e.g. laser-based SLAM).'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
