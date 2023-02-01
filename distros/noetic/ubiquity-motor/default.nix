
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, diagnostic-updater, diff-drive-controller, dynamic-reconfigure, geometry-msgs, hardware-interface, joint-state-controller, message-generation, message-runtime, nav-msgs, python3Packages, roscpp, rostest, std-msgs, tf }:
buildRosPackage {
  pname = "ros-noetic-ubiquity-motor";
  version = "0.14.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ubiquity_motor-release";
    rev = "db1a61d7da6d512eca05af77dd0e3818e717e8e5";
    owner = "UbiquityRobotics-release";
    sha256 = "sha256-gaY+2VGkoHAPeWH6fq+MzFCLaK15dXCeTe4Yv1uQzOM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation roscpp ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ controller-manager diagnostic-updater diff-drive-controller dynamic-reconfigure geometry-msgs hardware-interface joint-state-controller message-runtime nav-msgs python3Packages.requests std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides a ROS interface to Ubiquity Robotics Magni motor controllers'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
