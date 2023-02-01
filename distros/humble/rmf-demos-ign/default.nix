
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, launch-xml, rmf-building-sim-ignition-plugins, rmf-demos, rmf-robot-sim-ignition-plugins, ros-ign-bridge, teleop-twist-keyboard }:
buildRosPackage {
  pname = "ros-humble-rmf-demos-ign";
  version = "1.3.1-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_demos-release";
    rev = "ecc6ce742bd3316a1544393037aedf73a6e1997e";
    owner = "ros2-gbp";
    sha256 = "sha256-PpPMMvQ183MWkRRuhUEdvGLMwy8BLPdsR8VKOZkPKEg=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-xml rmf-building-sim-ignition-plugins rmf-demos rmf-robot-sim-ignition-plugins ros-ign-bridge teleop-twist-keyboard ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Launch files for RMF demos using the Ignition simulator'';
    license = with lib.licenses; [ asl20 ];
  };
}
