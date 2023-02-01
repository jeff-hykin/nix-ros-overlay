
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, boost, catkin, cv-bridge, darknet-ros-msgs, image-transport, message-generation, nodelet, opencv, roscpp, rospy, rostest, sensor-msgs, std-msgs, wget, xorg }:
buildRosPackage {
  pname = "ros-noetic-darknet-ros";
  version = "1.1.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "darknet_ros-release";
    rev = "9f448396ffa31cb6e4383de6205ac4025436fdf3";
    owner = "leggedrobotics";
    sha256 = "sha256-4i//MgNTTmJGAF1kDNmm+byM31xK4gtzkNZwpcYYph4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest wget ];
  propagatedBuildInputs = [ actionlib boost cv-bridge darknet-ros-msgs image-transport message-generation nodelet opencv roscpp rospy sensor-msgs std-msgs xorg.libX11 xorg.libXext xorg.libXtst ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Darknet is an open source neural network framework that runs on CPU and GPU. You only look once (YOLO) is a state-of-the-art, real-time object detection system.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
