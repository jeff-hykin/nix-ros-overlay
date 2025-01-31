
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, gazebo-ros, gazebo-ros-control, urdf, xacro }:
buildRosPackage {
  pname = "ros-melodic-open-manipulator-with-tb3-gazebo";
  version = "1.1.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "open_manipulator_with_tb3_simulations-release";
    rev = "5bfdba60af480cfc9483f50a378378aa798315f8";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-qfaCkoRmASVKxpixynthfpzZCAmblNI2evP5rcBOgSk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ controller-manager gazebo-ros gazebo-ros-control urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Simulation package using gazebo for OpenManipulator with TurtleBot3'';
    license = with lib.licenses; [ asl20 ];
  };
}
