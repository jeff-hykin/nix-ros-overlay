
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, gazebo-plugins, gazebo-ros, gazebo-ros2-control, husky-control, husky-description, ros2launch, urdf, xacro }:
buildRosPackage {
  pname = "ros-foxy-husky-gazebo";
  version = "1.0.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "husky-release";
    rev = "7d731dd41aa3cb8842c482e219b041f4d96e1e50";
    owner = "clearpath-gbp";
    sha256 = "sha256-YjfPkbrElzx9F5iEKZ1V8bbW7GeMYyHT/bT38F4txJA=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control husky-control husky-description ros2launch urdf xacro ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Clearpath Husky Simulator bringup'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
