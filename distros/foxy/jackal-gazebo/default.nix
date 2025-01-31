
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, gazebo-plugins, gazebo-ros, gazebo-ros2-control, jackal-control, jackal-description, ros2launch, urdf, xacro }:
buildRosPackage {
  pname = "ros-foxy-jackal-gazebo";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jackal_simulator-release";
    rev = "2e5c6a5ebe67184d69ad4daece652c1d9bcbf97f";
    owner = "clearpath-gbp";
    sha256 = "sha256-6t0sjVrpho2nHGtehW1JRpDi4ZWxlOLiIeOPwdT1DQ8=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control jackal-control jackal-description ros2launch urdf xacro ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Launchfiles to use Jackal in Gazebo.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
