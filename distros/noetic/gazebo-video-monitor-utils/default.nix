
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-msgs, rospy, std-srvs }:
buildRosPackage {
  pname = "ros-noetic-gazebo-video-monitor-utils";
  version = "0.7.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gazebo_video_monitors-release";
    rev = "d4910f2ab05be4ee68a9c8a6d173b139b485f243";
    owner = "nlamprian";
    sha256 = "sha256-J9W2dP1gGkvTYbmGm4EpQGVjggSKfZL/ove1tBiPWt4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-msgs rospy std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''gazebo_video_monitor_utils contains utility scripts that are meant to interact with the gazebo video monitor plugins.'';
    license = with lib.licenses; [ gpl3Only ];
  };
}
