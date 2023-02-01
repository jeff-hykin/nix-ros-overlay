
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, diagnostic-updater, diff-drive-controller, dynamic-reconfigure, geometry-msgs, hardware-interface, joint-state-controller, nav-msgs, pythonPackages, roscpp, rostest, serial, std-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-ubiquity-motor";
  version = "0.10.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ubiquity_motor-release";
    rev = "b10325fbd214ada9c84a8befa35190c598c00ac7";
    owner = "UbiquityRobotics-release";
    sha256 = "sha256-qmjXLV46sVDYH2z0fsUTfwmF1hHpUFSI0BaaL+UBpuc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roscpp ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ controller-manager diagnostic-updater diff-drive-controller dynamic-reconfigure geometry-msgs hardware-interface joint-state-controller nav-msgs pythonPackages.requests serial std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides a ROS interface to Ubiquity Robotics Magni motor controllers'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
