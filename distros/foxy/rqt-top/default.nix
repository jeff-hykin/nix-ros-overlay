
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, python-qt-binding, python3Packages, rclpy, rqt-gui, rqt-gui-py }:
buildRosPackage {
  pname = "ros-foxy-rqt-top";
  version = "1.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt_top-release";
    rev = "4596ade694c634799526a2f177c967f416feb19c";
    owner = "ros2-gbp";
    sha256 = "sha256-1HuHE0nfXmn2SZzagKTlYPIOS4z859Bdyv9dyGxbFJM=";
  };

  buildType = "ament_python";
  propagatedBuildInputs = [ python-qt-binding python3Packages.psutil rclpy rqt-gui rqt-gui-py ];

  meta = {
    description = ''RQT plugin for monitoring ROS processes.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
