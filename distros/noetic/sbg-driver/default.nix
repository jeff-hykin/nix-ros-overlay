
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, nav-msgs, roscpp, sensor-msgs, std-msgs, std-srvs, tf2-geometry-msgs, tf2-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-noetic-sbg-driver";
  version = "3.1.1-r7";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "sbg_ros_driver-release";
    rev = "41b149209502de8f65a6afbc04a0bb6faf79efcc";
    owner = "SBG-Systems";
    sha256 = "sha256-JA2fWJxDT+voGEzlNo8hJF5Dq+vLNn5WPnQDumXPQN0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime nav-msgs roscpp sensor-msgs std-msgs std-srvs tf2-geometry-msgs tf2-msgs tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS driver package for communication with the SBG navigation systems.'';
    license = with lib.licenses; [ mit ];
  };
}
