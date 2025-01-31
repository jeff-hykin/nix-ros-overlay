
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros-control-select-joints, hector-gazebo-thermal-camera, hector-sensors-description, hector-xacro-tools, xacro }:
buildRosPackage {
  pname = "ros-noetic-hector-components-description";
  version = "0.5.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_models-release";
    rev = "a6538a1c9be21deb0268b99d6e01e9654789aa8a";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-J7E5/f4NXbZum/tO5MIptiAECBdHVW1sWFONLjzI/NM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros-control-select-joints hector-gazebo-thermal-camera hector-sensors-description hector-xacro-tools xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_components_description contains URDF xacro macros for robot components, so they are easily attachable to robot models.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
