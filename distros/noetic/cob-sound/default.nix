
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, alsaOss, catkin, cob-srvs, diagnostic-msgs, message-generation, message-runtime, roscpp, rospy, std-msgs, std-srvs, visualization-msgs, vlc }:
buildRosPackage {
  pname = "ros-noetic-cob-sound";
  version = "0.7.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_driver-release";
    rev = "fd671d54078214eb908baa0b1e8c36c03025a81c";
    owner = "ipa320";
    sha256 = "sha256-SIsBq+r56xVt433DMTzxD2aKVhbW1cRoUILYnQNH7sE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib actionlib-msgs alsaOss cob-srvs diagnostic-msgs message-runtime roscpp rospy std-msgs std-srvs visualization-msgs vlc ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package implements a sound play module using text2wave and aplay through python.'';
    license = with lib.licenses; [ asl20 ];
  };
}
