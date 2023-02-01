
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, async-web-server-cpp, catkin, cv-bridge, ffmpeg, image-transport, roscpp, roslib, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-web-video-server";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "web_video_server-release";
    rev = "7187f300774754f747f7907611c9a19415b82fd5";
    owner = "RobotWebTools-release";
    sha256 = "sha256-w++hr6hEgw4PzjhdA6grjz/yv2dbndwSVdw8EqiUf94=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ async-web-server-cpp cv-bridge ffmpeg image-transport roscpp roslib sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''HTTP Streaming of ROS Image Topics in Multiple Formats'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
