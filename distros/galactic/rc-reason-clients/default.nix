
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, geometry-msgs, python3Packages, pythonPackages, rc-reason-msgs, rclpy, ros2pkg, tf2-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-galactic-rc-reason-clients";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rc_reason_clients-release";
    rev = "9b883710f661a9260f2868d4fe2a5062941583ee";
    owner = "roboception-gbp";
    sha256 = "sha256-q8bf4j9FheYgZ5vye7iL7FeN6Z3sl01sbjjAokkfCKk=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ geometry-msgs python3Packages.requests rc-reason-msgs rclpy ros2pkg tf2-msgs visualization-msgs ];

  meta = {
    description = ''Clients for interfacing with Roboception reason modules on rc_visard and rc_cube.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
