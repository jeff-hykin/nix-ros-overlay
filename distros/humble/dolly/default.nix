
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, dolly-follow, dolly-gazebo, dolly-ignition }:
buildRosPackage {
  pname = "ros-humble-dolly";
  version = "0.4.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dolly-release";
    rev = "41f3672d20dab6b42086fa188556992b426ee518";
    owner = "ros2-gbp";
    sha256 = "sha256-1ugxemjgNM3QtSsQ64TCZHu8J9gYPS5Qh2s6VRBTiFA=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ dolly-follow dolly-gazebo dolly-ignition ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Meta-package for Dolly, the robot sheep.'';
    license = with lib.licenses; [ asl20 ];
  };
}
