
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, angles, catkin, control-msgs, geometry-msgs, kdl-conversions, kdl-parser, message-generation, message-runtime, move-base-msgs, orocos-kdl, roscpp, rospy, sensor-msgs, tf, tf-conversions, tf2-ros, trajectory-msgs }:
buildRosPackage {
  pname = "ros-noetic-cob-lookat-action";
  version = "0.7.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_manipulation-release";
    rev = "87aa6e3b04c62f4891e6ea72acbefb0b2304ca03";
    owner = "ipa320";
    sha256 = "sha256-lWRTdmSosQR2Bi+Dk0z2/LVZE4wjy2EBVwS/tVTy/KI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib actionlib-msgs angles control-msgs geometry-msgs kdl-conversions kdl-parser message-runtime move-base-msgs orocos-kdl roscpp rospy sensor-msgs tf tf-conversions tf2-ros trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''cob_lookat_action'';
    license = with lib.licenses; [ asl20 ];
  };
}
