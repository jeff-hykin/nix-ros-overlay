
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosbag, rosbag-snapshot-msgs, roscpp, rosgraph-msgs, roslint, rospy, rostest, rostopic, std-msgs, std-srvs, topic-tools }:
buildRosPackage {
  pname = "ros-noetic-rosbag-snapshot";
  version = "1.0.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag_snapshot-release";
    rev = "043df7ebd87ba00b6457d45c55da0d822b7a09e7";
    owner = "ros-gbp";
    sha256 = "sha256-edqGPY5C+67t9+vfvrkVCx87Porq5nIAGIlU2aihRRM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint rospy rostest rostopic std-msgs ];
  propagatedBuildInputs = [ rosbag rosbag-snapshot-msgs roscpp rosgraph-msgs std-srvs topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rosbag_snapshot package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
