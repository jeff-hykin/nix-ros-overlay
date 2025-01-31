
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dingo-control, dingo-description, gazebo-plugins, gazebo-ros, gazebo-ros-control, hector-gazebo-plugins, ridgeback-gazebo-plugins, roslaunch }:
buildRosPackage {
  pname = "ros-noetic-dingo-gazebo";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dingo_simulator-release";
    rev = "e1c938edda0f6e179b7ca0b65f637c0d094dfd15";
    owner = "clearpath-gbp";
    sha256 = "sha256-4ghgMo3ectl8JNje839fy5GJGW0m/DSO1b9dmmWQExA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch ];
  propagatedBuildInputs = [ dingo-control dingo-description gazebo-plugins gazebo-ros gazebo-ros-control hector-gazebo-plugins ridgeback-gazebo-plugins ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launchfiles to use Dingo in Gazebo.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
