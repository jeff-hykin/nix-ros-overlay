
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-pytest, builtin-interfaces, python3Packages, pythonPackages, rclpy, rosidl-parser, rosidl-runtime-py, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-grepros";
  version = "0.5.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grepros-release";
    rev = "ed3f158d2ed40540b3046f7a1388b4498a4a688b";
    owner = "suurjaak";
    sha256 = "sha256-xNIkYkH5iGMMZWXABQF8VH5UPVyLZIyYW7MsG1MZG4E=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-cmake-pytest pythonPackages.pytest std-msgs ];
  propagatedBuildInputs = [ builtin-interfaces python3Packages.pyyaml rclpy rosidl-parser rosidl-runtime-py ];

  meta = {
    description = ''grep for ROS bag files and live topics'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
