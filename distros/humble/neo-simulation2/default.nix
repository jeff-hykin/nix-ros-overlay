
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-copyright, ament-flake8, ament-pep257, pythonPackages }:
buildRosPackage {
  pname = "ros-humble-neo-simulation2";
  version = "1.0.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "neo_simulation2-release";
    rev = "4e5a0709f962636ef5ecca684d8a2f38b4f8a71e";
    owner = "ros2-gbp";
    sha256 = "sha256-AEgFzFZfgKi6yp6aeHAETABt5PXW2Ugz993IleDbO9k=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''ROS-2 Simulation packages for neobotix robots'';
    license = with lib.licenses; [ mit ];
  };
}
