
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, urdf, xacro }:
buildRosPackage {
  pname = "ros-melodic-robosense-description";
  version = "1.0.0-r1";

  src = fetchurl {
    url = "https://github.com/tomlogan501/robosense_simulator_release/archive/98956c26250293acf16c28e3ebbbb0d287670e83.tar.gz";
    sha256 = "sha256-HxOJvGb0dlWiJyhJ01ucwnENknD2m7ngLwbohilmFW8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''URDF and meshes describing Robosense laser scanners.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
