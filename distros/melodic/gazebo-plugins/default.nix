
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, camera-info-manager, catkin, cv-bridge, diagnostic-updater, dynamic-reconfigure, gazebo-dev, gazebo-msgs, gazebo-ros, geometry-msgs, image-transport, message-generation, message-runtime, nav-msgs, nodelet, polled-camera, rosconsole, roscpp, rosgraph-msgs, rospy, rostest, sensor-msgs, std-msgs, std-srvs, tf, tf2-ros, trajectory-msgs, urdf }:
buildRosPackage {
  pname = "ros-melodic-gazebo-plugins";
  version = "2.8.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gazebo_ros_pkgs-release";
    rev = "4f6ad9e88cf9b6b71772981279a0aefb6c992c89";
    owner = "ros-gbp";
    sha256 = "sha256-5TTme8cZcaczl+zlQeVLslrD118UuLwBMMSJV9ED6sU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ angles camera-info-manager cv-bridge diagnostic-updater dynamic-reconfigure gazebo-dev gazebo-msgs gazebo-ros geometry-msgs image-transport message-runtime nav-msgs nodelet polled-camera rosconsole roscpp rosgraph-msgs rospy sensor-msgs std-msgs std-srvs tf tf2-ros trajectory-msgs urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable components.'';
    license = with lib.licenses; [ "BSD-&-Apache-2.0" ];
  };
}
