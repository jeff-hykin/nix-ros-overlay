
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, access-point-control, catkin, dynamic-reconfigure, ieee80211-channels, rospy }:
buildRosPackage {
  pname = "ros-melodic-hostapd-access-point";
  version = "1.0.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "linux_networking-release";
    rev = "13d0f31c1f828bdd3b8fbe08f5015cb2abfbf390";
    owner = "pr2-gbp";
    sha256 = "sha256-6GHJCeVsqVYp/9ow6DFkE4bhypXzqgHbomvBFrsJC3Q=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ access-point-control dynamic-reconfigure ieee80211-channels rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A ROS node that controls a hostapd-based access
    point. It is mainly intended for use with a wireless 
    network adapter running in master mode. It implements 
    the dynamic_reconfigure interface defined
    in the [[access_point_control]] package.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
