
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, turtlebot4-viz }:
buildRosPackage {
  pname = "ros-galactic-turtlebot4-desktop";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot4_desktop-release";
    rev = "e37225e4d6435f8c44f85a79c0a31ca6331078a0";
    owner = "ros2-gbp";
    sha256 = "sha256-myxM6U+lYopiyZAORft5uqxzeGJIVRzXIfM6rMm0zrY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot4-viz ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Turtlebot4 Desktop Metapackage'';
    license = with lib.licenses; [ asl20 ];
  };
}
