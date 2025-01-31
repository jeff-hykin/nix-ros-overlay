
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-info-manager-py, catkin, dynamic-reconfigure, geometry-msgs, message-generation, message-runtime, rospy, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-axis-camera";
  version = "0.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "axis_camera-release";
    rev = "4835484e2aba8f5c498acb1d8b0cadb1aba7473e";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-wamh90sv2PS7hR8+rlYiYvcPS89B8Cpi36YzsCTniEM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ camera-info-manager-py dynamic-reconfigure geometry-msgs message-runtime rospy sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Python ROS drivers for accessing an Axis camera's MJPG
    stream. Also provides control for PTZ cameras.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
