
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, access-point-control, catkin, dynamic-reconfigure, ieee80211-channels, rospy }:
buildRosPackage {
  pname = "ros-melodic-ddwrt-access-point";
  version = "1.0.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "linux_networking-release";
    rev = "1d72c65942bceeea16e0e1cd9c0f523065be7671";
    owner = "pr2-gbp";
    sha256 = "sha256-eQN6M/WWJ107xV4BX07qKxBUMLoRFY/r5rYPmKT2T04=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ access-point-control dynamic-reconfigure ieee80211-channels rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A ROS node that controls a Linksys WRT610Nv2 access point with
    a dd-wrt firmware. Other access points models/dd-wrt versions
    may be compatible as long as the web interface is identical.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
