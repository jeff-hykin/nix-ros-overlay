
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, geometry-msgs, jsk-footstep-msgs, jsk-interactive-marker, jsk-pcl-ros, jsk-recognition-msgs, jsk-recognition-utils, jsk-rviz-plugins, jsk-topic-tools, message-generation, pcl-ros, roscpp, roseus, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-jsk-footstep-planner";
  version = "0.1.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_control-release";
    rev = "42ed91cc666486b6895227e0be75b000ee7116fc";
    owner = "tork-a";
    sha256 = "sha256-d22ielC/PDHwo6NqeoocfX8Ak27TsRPnqs2tZcKlY7w=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ dynamic-reconfigure geometry-msgs jsk-footstep-msgs jsk-interactive-marker jsk-pcl-ros jsk-recognition-msgs jsk-recognition-utils jsk-rviz-plugins jsk-topic-tools pcl-ros roscpp roseus visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''jsk_footstep_planner'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
