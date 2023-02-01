
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, flir-camera-description, spinnaker-camera-driver }:
buildRosPackage {
  pname = "ros-noetic-flir-camera-driver";
  version = "0.2.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "flir_camera_driver-release";
    rev = "7dd2161f5ed7274da96ab226d05e747900fea71c";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-rzOUli+sMOwgZPPkEbfKVjT6LoDktUjjqoNYhPsweGw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ flir-camera-description spinnaker-camera-driver ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A set of drivers for Flir cameras based on the Spinnaker SDK.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
