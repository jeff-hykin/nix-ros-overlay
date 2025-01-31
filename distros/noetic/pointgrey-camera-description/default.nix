
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, robot-state-publisher, urdf, xacro }:
buildRosPackage {
  pname = "ros-noetic-pointgrey-camera-description";
  version = "0.15.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pointgrey_camera_driver-release";
    rev = "63660d51983d852906a7a9e7d8de63165aea46da";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-fcfQUGR08ugHXxM27riVk8xkpynQRa15lB2JtUZQaMY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ robot-state-publisher urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''URDF descriptions for Point Grey cameras'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
