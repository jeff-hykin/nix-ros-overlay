
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, roscpp, roslaunch, roslint, tf2-ros, vrpn }:
buildRosPackage {
  pname = "ros-noetic-vrpn-client-ros";
  version = "0.2.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vrpn_client_ros-release";
    rev = "713eb37c766b70b090eee0b04a77007c7039a44a";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-ITmpgU8fS0E7LnQgj0wl+8RVyq4hydk+Keqm69lxG1U=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch roslint ];
  propagatedBuildInputs = [ geometry-msgs roscpp tf2-ros vrpn ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS client nodes for the <a href="https://github.com/vrpn/vrpn/wiki">VRPN</a> library, compatible with VICON, OptiTrack, and other <a href="https://github.com/vrpn/vrpn/wiki/Supported-hardware-devices">hardware interfaces</a>.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
