
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, pythonPackages, rclpy, wireless-msgs, wirelesstools }:
buildRosPackage {
  pname = "ros-foxy-wireless-watcher";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "wireless-release";
    rev = "2af17461dc8e715470430508720a539351e4994b";
    owner = "clearpath-gbp";
    sha256 = "sha256-zyVzWCGjMUizzl3UcYuiYkto+NUNdcDFxMXBRsLfVS8=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ rclpy wireless-msgs wirelesstools ];

  meta = {
    description = ''A Python-based node which publishes connection information about a linux wireless interface.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
