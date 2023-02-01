
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, fake-localization, gazebo-ros, joint-state-publisher, mir-description, mir-driver, robot-localization, robot-state-publisher, roslaunch, rostopic, rqt-robot-steering, topic-tools }:
buildRosPackage {
  pname = "ros-noetic-mir-gazebo";
  version = "1.1.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mir_robot-release";
    rev = "1ac9d66483c95ab3275940ef3c9b016828abd452";
    owner = "uos-gbp";
    sha256 = "sha256-1nz3e/CmQcWirdp/VXACN3YxPP3kPM02vY5cOPion6s=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslaunch ];
  propagatedBuildInputs = [ controller-manager fake-localization gazebo-ros joint-state-publisher mir-description mir-driver robot-localization robot-state-publisher rostopic rqt-robot-steering topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Simulation specific launch and configuration files for the MiR robot.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
