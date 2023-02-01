
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, joy, teleop-twist-joy, teleop-twist-keyboard }:
buildRosPackage {
  pname = "ros-humble-leo-teleop";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "leo_common-release";
    rev = "4e2e7eb991b8799679addfaf533df66649873fc5";
    owner = "ros2-gbp";
    sha256 = "sha256-b+43cpCbYIO6jZvix2hLEbOH6RocS5OU2T9INwE/BBk=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joy teleop-twist-joy teleop-twist-keyboard ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Scripts and launch files for Leo Rover teleoperation'';
    license = with lib.licenses; [ mit ];
  };
}
