
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, roscpp, rospy, rostest, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-radar-omnipresense";
  version = "0.3.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "radar_omnipresense-release";
    rev = "92ed94b267e649f3d3734d8c4df08516a840894f";
    owner = "SCU-RSL-ROS";
    sha256 = "sha256-+10LMY4hFNcCm4ZSWVxSpJbBHSEfoDyOf+J3FXmpfgo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rostest ];
  propagatedBuildInputs = [ message-generation message-runtime roscpp rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This is the radar driver package developed for the omnipresense radar module.'';
    license = with lib.licenses; [ "EPL-2.0" ];
  };
}
