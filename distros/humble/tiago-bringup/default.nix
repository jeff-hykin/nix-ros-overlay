
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, ament-lint-auto, ament-lint-common, joy-teleop, launch-pal, robot-state-publisher, tiago-controller-configuration, tiago-description, twist-mux }:
buildRosPackage {
  pname = "ros-humble-tiago-bringup";
  version = "4.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tiago_robot-release";
    rev = "31485fc53ed13cf40003bc9a06dfa8fefa144f0c";
    owner = "pal-gbp";
    sha256 = "sha256-VqAjgBteNjH4NqYWBQwwl3wljc5/d4Cnb/n3fLTIRjc=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ joy-teleop launch-pal robot-state-publisher tiago-controller-configuration tiago-description twist-mux ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''Launch files to upload the robot description and start the controllers'';
    license = with lib.licenses; [ asl20 ];
  };
}
