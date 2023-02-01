
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, pythonPackages, rclpy }:
buildRosPackage {
  pname = "ros-foxy-rosxbeepy";
  version = "0.0.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ROSXBee-release";
    rev = "7a075d99b2fede4f847eed3698e3373950e7fc18";
    owner = "Sudharsan10";
    sha256 = "sha256-6ooykAGOPuAdPg3xm2OgfNMuPPXnoWOJcok4rW959DU=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ rclpy ];

  meta = {
    description = ''A ROS2 wrapper for xbee devices using digi-xbee python API'';
    license = with lib.licenses; [ "TODO-License-declaration" ];
  };
}
