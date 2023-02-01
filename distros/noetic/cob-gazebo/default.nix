
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-bringup, cob-default-robot-config, cob-gazebo-ros-control, cob-hardware-config, cob-script-server, cob-supported-robots, control-msgs, gazebo-plugins, gazebo-ros, gazebo-ros-control, roslaunch, rospy, rostest, trajectory-msgs }:
buildRosPackage {
  pname = "ros-noetic-cob-gazebo";
  version = "0.7.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_simulation-release";
    rev = "37d380ac098742d9b67333c0eac0d040be621b1a";
    owner = "ipa320";
    sha256 = "sha256-U6/vAxc99kCTGPxarjF5Kj0sP0A+Nd/QQucoNw2CnK8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ cob-supported-robots roslaunch ];
  propagatedBuildInputs = [ cob-bringup cob-default-robot-config cob-gazebo-ros-control cob-hardware-config cob-script-server control-msgs gazebo-plugins gazebo-ros gazebo-ros-control rospy rostest trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch files and tools for 3D simulation of Care-O-bot in gazebo simulator.'';
    license = with lib.licenses; [ asl20 ];
  };
}
