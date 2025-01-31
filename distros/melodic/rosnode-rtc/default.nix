
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, openrtm-tools, roscpp-tutorials, rospy, rostopic }:
buildRosPackage {
  pname = "ros-melodic-rosnode-rtc";
  version = "1.4.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rtmros_common-release";
    rev = "4b6188d71a6a458a245a4b10b614e99927967a59";
    owner = "tork-a";
    sha256 = "sha256-qQl4lh84pcVQH6TJ7pqIq1GT/1f1znN7U+fQSbGcgAw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roscpp-tutorials rospy rostopic ];
  propagatedBuildInputs = [ openrtm-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package gives transparency between RTM and ROS.

     rtmros-data-bridge.py is a RT-Component for dataport/topic.
     This automatically convert ROS/topic into RTM/dataport.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
