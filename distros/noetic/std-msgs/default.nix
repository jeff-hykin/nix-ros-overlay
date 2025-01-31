
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime }:
buildRosPackage {
  pname = "ros-noetic-std-msgs";
  version = "0.5.13-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "std_msgs-release";
    rev = "6455e024725ac9335e16d6eadb75cc8b3643c6fd";
    owner = "ros-gbp";
    sha256 = "sha256-0Cb5uqwYfYAiMzIEdnwzrIWALdQPlTOWFJFIL5GvEGI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Standard ROS Messages including common message types representing primitive data types and other basic message constructs, such as multiarrays.
    For common, generic robot-specific message types, please see <a href="http://www.ros.org/wiki/common_msgs">common_msgs</a>.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
