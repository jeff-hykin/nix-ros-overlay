
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cv-bridge, diagnostic-msgs, diagnostic-updater, geometry-msgs, image-transport, kdl-parser, naoqi-bridge-msgs, naoqi-libqi, naoqi-libqicore, orocos-kdl, robot-state-publisher, rosbag-storage, rosconsole, rosgraph-msgs, sensor-msgs, tf2-geometry-msgs, tf2-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-noetic-naoqi-driver";
  version = "0.5.13";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "naoqi_driver-release";
    rev = "71384514c209731ba9e3cf4dd7bf9e25bdab5eb1";
    owner = "ros-naoqi";
    sha256 = "sha256-Lwc/27qwsnn4JG0kMgkiApPCiL511rSNTesP3/5Ia4k=";
  };

  buildType = "catkin";
  buildInputs = [ catkin diagnostic-msgs diagnostic-updater geometry-msgs rosgraph-msgs sensor-msgs tf2-geometry-msgs tf2-msgs ];
  propagatedBuildInputs = [ boost cv-bridge image-transport kdl-parser naoqi-bridge-msgs naoqi-libqi naoqi-libqicore orocos-kdl robot-state-publisher rosbag-storage rosconsole tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Driver module between Aldebaran's NAOqiOS and ROS. It publishes all sensor and actuator data as well as basic diagnostic for battery, temperature. It subscribes also to RVIZ simple goal and cmd_vel for teleop.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
