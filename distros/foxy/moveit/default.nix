
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, moveit-core, moveit-planners, moveit-plugins, moveit-ros }:
buildRosPackage {
  pname = "ros-foxy-moveit";
  version = "2.2.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "moveit2-release";
    rev = "10c4647c6a43fd633c5792b9d939280fe0728dcd";
    owner = "moveit";
    sha256 = "sha256-hc6O3xBng9djQVOwUBzW53amHbvW8T/r65f8Px3LWtk=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ moveit-core moveit-planners moveit-plugins moveit-ros ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Meta package that contains all essential packages of MoveIt 2'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
