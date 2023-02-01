
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, robot-state-publisher, urdf, xacro }:
buildRosPackage {
  pname = "ros-noetic-flir-camera-description";
  version = "0.2.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "flir_camera_driver-release";
    rev = "194abfefe03bca881349e80911b0e7f5ee2c9350";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-vYzKb/A0QgOewGMN1l+ibHKhSD2fKOky+QkQJChVvps=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''URDF descriptions for Flir cameras'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
