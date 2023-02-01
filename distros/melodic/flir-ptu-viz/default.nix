
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, flir-ptu-description, joint-state-publisher, robot-state-publisher, roslaunch, rviz }:
buildRosPackage {
  pname = "ros-melodic-flir-ptu-viz";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "flir_ptu-release";
    rev = "04a550e1f19ec9740772810cefd378c1c7ec07e5";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-a/jScuyFZGhvDjglRQdwIZGvzODz5tMlVQ5sPO2QfGI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslaunch ];
  propagatedBuildInputs = [ flir-ptu-description joint-state-publisher robot-state-publisher rviz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launchfiles and rviz configs to assist with visualizing the FLIR PTUs.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
