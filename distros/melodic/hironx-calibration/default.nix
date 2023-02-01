
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, calibration-estimation, calibration-launch, catkin, hironx-moveit-config, kdl-parser, openni2-launch, orocos-kdl }:
buildRosPackage {
  pname = "ros-melodic-hironx-calibration";
  version = "2.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rtmros_hironx-release";
    rev = "2f8dc3013bd971844af8b5f5c3fb4cabb93361b6";
    owner = "tork-a";
    sha256 = "sha256-mQHYkzCJQm+3VyhdmWYXPC5fPNmc7J0Y3IYjCOwXfOo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ calibration-estimation calibration-launch hironx-moveit-config kdl-parser openni2-launch orocos-kdl ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch and configuration files for calibrating hironx using the generic <a href="http://wiki.ros.org/calibration_setup_helper">calibration_setup_helper</a> package.

   THIS FILE IS AUTOMATICALLY GENERATED BY:<br/>
   <code>
   rosrun calibration_setup_helper calibration_setup_helper.py `rospack find hironx_moveit_config`/HiroNX.urdf --base-link CHEST_JOINT0_Link --arm-tip-link RARM_JOINT5_Link --head-tip-link HEAD_JOINT1_Link --arm-controller=rarm_controller/command --head-controller=head_controller/command --head-camera-frame camera_rgb_optical_frame --head-camera-joint head_to_kinect_joint
   </code>'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
