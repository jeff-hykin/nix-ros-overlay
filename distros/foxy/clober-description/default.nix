
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, urdf }:
buildRosPackage {
  pname = "ros-foxy-clober-description";
  version = "0.2.0-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "clober_ros2-release";
    rev = "fd63b2db7f30d38bd783b2401784980e504e78ae";
    owner = "CLOBOT-Co-Ltd-release";
    sha256 = "sha256-xuI088CF6wQndpG2+5LW2t9rWSNwlNr7E88v4vWp0Ks=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ urdf ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''clober for simulation and visualization'';
    license = with lib.licenses; [ asl20 ];
  };
}
