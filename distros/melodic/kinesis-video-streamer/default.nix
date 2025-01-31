
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, aws-ros1-common, catkin, gtest, image-transport, kinesis-manager, kinesis-video-msgs, roscpp, rostest, rostopic, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-kinesis-video-streamer";
  version = "2.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "kinesis_video_streamer-release";
    rev = "8557cdb434f3975cda617b60bec5e7846eb06503";
    owner = "aws-gbp";
    sha256 = "sha256-vkA4+UztYasIaN/twFWYskiAmkTJQQ9qt9BXVVcX/0w=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest rostest rostopic ];
  propagatedBuildInputs = [ aws-common aws-ros1-common image-transport kinesis-manager kinesis-video-msgs roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Kinesis Video Streams producer node'';
    license = with lib.licenses; [ asl20 ];
  };
}
