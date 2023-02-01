
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-msgs, gazebo-plugins, gazebo-ros, gazebo-ros-control, gazebo-ros-pkgs, roscpp, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-rr-openrover-description";
  version = "1.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rr_openrover_stack-release";
    rev = "f268bb0e7181a7a3e9f24fb9c26b8bf0e7957dad";
    owner = "RoverRobotics-release";
    sha256 = "sha256-t2xcEvOxViqXtmZY4DgzCAFZbb5t3hjTXOXcohL5iso=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-msgs gazebo-plugins gazebo-ros gazebo-ros-control gazebo-ros-pkgs roscpp rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rr_openrover_description package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
