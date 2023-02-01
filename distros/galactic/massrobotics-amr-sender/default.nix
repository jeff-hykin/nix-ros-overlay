
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, common-interfaces, python3Packages, pythonPackages, rclpy, tf2-kdl }:
buildRosPackage {
  pname = "ros-galactic-massrobotics-amr-sender";
  version = "1.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_amr_interop-release";
    rev = "2fc11e90ebc6fe9017c9df4f29137f042716b9cc";
    owner = "inorbit-ai";
    sha256 = "sha256-tkonIOMY+pdqYFlO07YHctRYvgH2oGlaj57nw4NqGiE=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 common-interfaces python3Packages.jsonschema python3Packages.mock python3Packages.pep8 python3Packages.pytest-mock python3Packages.pyyaml pythonPackages.pytest ];
  propagatedBuildInputs = [ python3Packages.pykdl python3Packages.websockets rclpy tf2-kdl ];

  meta = {
    description = ''MassRobotics AMR Interop Sender'';
    license = with lib.licenses; [ "3-Clause-BSD-License" ];
  };
}
