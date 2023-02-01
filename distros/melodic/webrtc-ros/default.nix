
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, async-web-server-cpp, catkin, cv-bridge, image-transport, message-generation, message-runtime, nodelet, roscpp, std-msgs, webrtc }:
buildRosPackage {
  pname = "ros-melodic-webrtc-ros";
  version = "59.0.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "webrtc_ros-release";
    rev = "f77c6fc2ea8563c0bbe8626cc3f6ddd12e477a9a";
    owner = "RobotWebTools-release";
    sha256 = "sha256-8uk6R26iOfjloslllhLgQXyPKZ81VYQZlWsuWUllb0c=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ async-web-server-cpp cv-bridge image-transport message-runtime nodelet roscpp std-msgs webrtc ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A collection of ROS utilities for using WebRTC with ROS'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
