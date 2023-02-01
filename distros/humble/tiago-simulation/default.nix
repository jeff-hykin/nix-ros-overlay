
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, tiago-gazebo }:
buildRosPackage {
  pname = "ros-humble-tiago-simulation";
  version = "4.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tiago_simulation-release";
    rev = "56196d72de8fd4be2cc37ed9a1956327a63124ca";
    owner = "pal-gbp";
    sha256 = "sha256-CCFztISmrnIJgFLfTGVqoEY4STOtF06QESFYDk9Cvm8=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tiago-gazebo ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''The tiago_simulation package'';
    license = with lib.licenses; [ asl20 ];
  };
}
