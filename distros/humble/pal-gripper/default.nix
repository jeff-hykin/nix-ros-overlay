
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, pal-gripper-controller-configuration, pal-gripper-description }:
buildRosPackage {
  pname = "ros-humble-pal-gripper";
  version = "3.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pal_gripper-release";
    rev = "16248618703537ec5fa5eb68a2cec77181e69fb6";
    owner = "pal-gbp";
    sha256 = "sha256-qxn0Pwpu7Ef5ty+3nYma0i+tUYjvULkzADL7eSX4wqE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pal-gripper-controller-configuration pal-gripper-description ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''The pal_gripper package'';
    license = with lib.licenses; [ asl20 ];
  };
}
