
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, dynamic-reconfigure, image-geometry, image-transport, image-view, marker-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-tuw-checkerboard";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tuw_marker_detection-release";
    rev = "a1be669b67c1f64c8192ff356dc04762e16458d2";
    owner = "tuw-robotics";
    sha256 = "sha256-HPz21moK3O9n3ixudFErqZC5mkP/kniy4fi728qtZbw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge dynamic-reconfigure image-geometry image-transport image-view marker-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The tuw_checkerboard package is designed to detect one 
    checkerboard and to estimate the pose of the checkerboard relative to the camera.
    The detection itself is based on the opencv functions for checkerboards.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
