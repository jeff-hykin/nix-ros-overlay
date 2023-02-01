
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-updater, fadecandy-msgs, libusb1, roscpp, rospy }:
buildRosPackage {
  pname = "ros-noetic-fadecandy-driver";
  version = "0.2.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fadecandy_ros-release";
    rev = "c72bd06e7d83a74be922becf44c6f5b12088726d";
    owner = "iron-ox";
    sha256 = "sha256-KjXoanwjRLMiPl78FpQ3TzhmW5ET2emuUs6IDKvYA+Y=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rospy ];
  propagatedBuildInputs = [ diagnostic-updater fadecandy-msgs libusb1 roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS driver for fadecandy LED controllers'';
    license = with lib.licenses; [ asl20 ];
  };
}
