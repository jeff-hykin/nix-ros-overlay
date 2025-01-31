
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ros-base, ros-ign-bridge, ros-ign-gazebo, ros-ign-image, ros-ign-interfaces }:
buildRosPackage {
  pname = "ros-rolling-simulation";
  version = "0.10.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "variants-release";
    rev = "977d993a291b37223001ed427a4a096d3588b859";
    owner = "ros2-gbp";
    sha256 = "sha256-bvicFtHnIqmwZPfpdtNprdkWQWqSKGs+cezebLL0sUs=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-base ros-ign-bridge ros-ign-gazebo ros-ign-image ros-ign-interfaces ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A package which extends 'ros_base' and includes simulation packages.'';
    license = with lib.licenses; [ asl20 ];
  };
}
