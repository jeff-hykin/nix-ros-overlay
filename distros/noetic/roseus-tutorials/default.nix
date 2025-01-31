
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, checkerboard-detector, image-proc, image-view2, jsk-pcl-ros, jsk-recognition-msgs, opencv-apps, posedetection-msgs, roseus, rostest, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-roseus-tutorials";
  version = "1.7.5-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_roseus-release";
    rev = "7f8c4533cbb4172e9798121473b7e98aa9f142ec";
    owner = "tork-a";
    sha256 = "sha256-QLtF5/GIAS/bEDXOGuvyQL1s7nY8E1P66yobu1Ul6s8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roseus ];
  checkInputs = [ jsk-pcl-ros rostest ];
  propagatedBuildInputs = [ checkerboard-detector image-proc image-view2 jsk-recognition-msgs opencv-apps posedetection-msgs visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''roseus_tutorials'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
