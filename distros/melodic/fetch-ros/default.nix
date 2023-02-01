
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, fetch-calibration, fetch-depth-layer, fetch-description, fetch-ikfast-plugin, fetch-maps, fetch-moveit-config, fetch-navigation, fetch-teleop }:
buildRosPackage {
  pname = "ros-melodic-fetch-ros";
  version = "0.8.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fetch_ros-release";
    rev = "3c1c3d2d8a4f739e0a008b2a6b6362dd27667276";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-/HzzOfAbTeqItj/2xN/IPLO3TdWsyWvdLwia6rz1I8Q=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ fetch-calibration fetch-depth-layer fetch-description fetch-ikfast-plugin fetch-maps fetch-moveit-config fetch-navigation fetch-teleop ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Fetch ROS, packages for working with Fetch and Freight'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
