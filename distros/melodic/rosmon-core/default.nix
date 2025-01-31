
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catch-ros, catkin, cmake-modules, diagnostic-msgs, libyamlcpp, ncurses, python, pythonPackages, rosbash, roscpp, rosfmt, roslib, rosmon-msgs, rospack, rostest, std-msgs, tinyxml }:
buildRosPackage {
  pname = "ros-melodic-rosmon-core";
  version = "2.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosmon-release";
    rev = "76a1a1881b7162bb01fb6ce174153c4d0fe75702";
    owner = "xqms";
    sha256 = "sha256-D77/dqa7YuhXmR5lUH4efs3vgTqtaNTYMtMP4UVngdc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin python ];
  checkInputs = [ catch-ros pythonPackages.rospkg rostest ];
  propagatedBuildInputs = [ boost cmake-modules diagnostic-msgs libyamlcpp ncurses rosbash roscpp rosfmt roslib rosmon-msgs rospack std-msgs tinyxml ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Node launcher and monitor for ROS. rosmon is a replacement
		for the roslaunch tool, focused on performance, remote
		monitoring, and usability.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
