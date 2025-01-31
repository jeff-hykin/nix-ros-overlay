
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros, robot-state-publisher, rostest, rosunit, uuv-assistants, uuv-descriptions, uuv-gazebo-ros-plugins, uuv-sensor-ros-plugins, xacro }:
buildRosPackage {
  pname = "ros-melodic-eca-a9-description";
  version = "0.1.6";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "eca_a9-release";
    rev = "3bf44b5bb3650aef190026d45a964d4d118f09a3";
    owner = "uuvsimulator";
    sha256 = "sha256-Ea37u8SoRGH2LJAJhVOcdN5+bT65Kihka6Bq1MMG6To=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest rosunit xacro ];
  propagatedBuildInputs = [ gazebo-ros robot-state-publisher uuv-assistants uuv-descriptions uuv-gazebo-ros-plugins uuv-sensor-ros-plugins ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Robot description for the ECA A9 AUV'';
    license = with lib.licenses; [ asl20 ];
  };
}
