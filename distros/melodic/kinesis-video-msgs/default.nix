
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-msgs, message-generation, message-runtime }:
buildRosPackage {
  pname = "ros-melodic-kinesis-video-msgs";
  version = "2.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "kinesis_video_streamer-release";
    rev = "6af6207a99552edbdfbd4367e2bd3a4f78a31719";
    owner = "aws-gbp";
    sha256 = "sha256-yGzplYDgHHMcN4kDPvIj+hdZ6HUwOwT1aZ45kkb4Qj8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ diagnostic-msgs message-runtime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages for transmitting video frames to Kinesis Video Streams'';
    license = with lib.licenses; [ asl20 ];
  };
}
