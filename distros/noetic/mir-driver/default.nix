
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, diagnostic-msgs, dynamic-reconfigure, geometry-msgs, mir-actions, mir-description, mir-msgs, move-base-msgs, nav-msgs, python3Packages, robot-state-publisher, rosgraph-msgs, roslaunch, rospy, rospy-message-converter, sensor-msgs, std-msgs, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-mir-driver";
  version = "1.1.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mir_robot-release";
    rev = "9be8dcaa47d79ce6bc49f026254b0cb5fef07812";
    owner = "uos-gbp";
    sha256 = "sha256-703WtDVwz8IW7iQkxWxe27eagbsoMBftB9OP/5C8ZEM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslaunch ];
  propagatedBuildInputs = [ actionlib-msgs diagnostic-msgs dynamic-reconfigure geometry-msgs mir-actions mir-description mir-msgs move-base-msgs nav-msgs python3Packages.websocket-client robot-state-publisher rosgraph-msgs rospy rospy-message-converter sensor-msgs std-msgs tf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A reverse ROS bridge for the MiR robot'';
    license = with lib.licenses; [ bsdOriginal asl20 ];
  };
}
