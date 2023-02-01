
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-dev, gazebo-ros, roscpp }:
buildRosPackage {
  pname = "ros-noetic-leo-gazebo-plugins";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "leo_simulator-release";
    rev = "fd65b6695c904b247651b1ab86f5af49cd1f74e9";
    owner = "fictionlab-gbp";
    sha256 = "sha256-G7Ka1HmNoZtk2Rat2nAKH6GTf18K7M/XSWoumgIB1YU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin gazebo-dev gazebo-ros roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Gazebo Plugins for simulating Leo Rover.'';
    license = with lib.licenses; [ mit ];
  };
}
