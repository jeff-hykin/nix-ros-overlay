
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, camera-calibration-parsers, catkin, cv-bridge, dynamic-reconfigure, image-geometry, image-transport, nodelet, nodelet-topic-tools, roscpp, rostest, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-image-proc";
  version = "1.17.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "image_pipeline-release";
    rev = "00d56b72b9f1ab261a2913f8204c6562340da79b";
    owner = "ros-gbp";
    sha256 = "sha256-bAfDVCk+o/IKITQ2GVF4eeAtMoi3Ar42JCe/T9Jk3Nc=";
  };

  buildType = "catkin";
  buildInputs = [ boost catkin ];
  checkInputs = [ camera-calibration-parsers rostest ];
  propagatedBuildInputs = [ cv-bridge dynamic-reconfigure image-geometry image-transport nodelet nodelet-topic-tools roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Single image rectification and color processing.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
