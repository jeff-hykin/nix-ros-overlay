
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, actionlib-tutorials, angles, catkin, coreutils, dynamic-reconfigure, euslisp, geneus, geometry-msgs, jskeus, message-generation, message-runtime, mk, rosbash, rosbuild, roscpp, roslang, rosmsg, rosnode, rospack, rostest, rostopic, sensor-msgs, std-msgs, std-srvs, tf, tf2-ros, visualization-msgs, xorg }:
buildRosPackage {
  pname = "ros-melodic-roseus";
  version = "1.7.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_roseus-release";
    rev = "d99fd3f664358226005b938dde48459ef8e8fa63";
    owner = "tork-a";
    sha256 = "sha256-zOq9bIchRpzK+pNdojywghqKiiwCYEwqgcxiLopZK98=";
  };

  buildType = "catkin";
  buildInputs = [ angles catkin coreutils message-generation mk rosbuild rostopic ];
  checkInputs = [ xorg.xorgserver ];
  propagatedBuildInputs = [ actionlib actionlib-msgs actionlib-tutorials dynamic-reconfigure euslisp geneus geometry-msgs jskeus message-runtime rosbash roscpp roslang rosmsg rosnode rospack rostest sensor-msgs std-msgs std-srvs tf tf2-ros visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''EusLisp client for ROS Robot Operating System.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
