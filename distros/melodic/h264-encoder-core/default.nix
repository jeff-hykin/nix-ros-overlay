
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, catkin, cmake, ffmpeg, gtest }:
buildRosPackage {
  pname = "ros-melodic-h264-encoder-core";
  version = "2.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "h264_encoder_core-release";
    rev = "e43664a9bfc426e7ac725e372aeb8e617f2d4387";
    owner = "aws-gbp";
    sha256 = "sha256-d8OkRKseYZCpBBsQ0qidBjB/AypP0fLdkLdC2dLWODA=";
  };

  buildType = "cmake";
  buildInputs = [ catkin cmake ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ aws-common ffmpeg ];
  nativeBuildInputs = [ catkin cmake ];

  meta = {
    description = ''Common base code for ROS1/ROS2 H264 encoder node'';
    license = with lib.licenses; [ "LGPL-2.1-only" ];
  };
}
