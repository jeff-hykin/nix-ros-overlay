
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, rospy }:
buildRosPackage {
  pname = "ros-melodic-network-traffic-control";
  version = "1.0.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "linux_networking-release";
    rev = "91c2b36d51c8cfc1267ff30cad9939e32ddd643a";
    owner = "pr2-gbp";
    sha256 = "sha256-3HpB8YYPquv9UefVy91OQGtEKTzCDOmTTgR81s1lFEM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A ROS node that allows control of network emulation parameters such as bandwidth, loss and latency for a Linux network interface.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
