
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, avahi, catkin, multimaster-msgs-fkie, pythonPackages, rosgraph, roslib, rospy, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-master-discovery-fkie";
  version = "0.8.12";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "multimaster_fkie-release";
    rev = "f8bef9d3d716bba0f417ac0a7e91c7520fac6ff0";
    owner = "fkie-release";
    sha256 = "sha256-gWgRtXGsFLD9y2ZfPcAme9SbIhlFx0DE7Lu+BaqW148=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ avahi multimaster-msgs-fkie pythonPackages.avahi rosgraph roslib rospy std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Discover the running ROS Masters in local network. The 
     discovering is done by sending an echo heartbeat messages to a defined 
     multicast group.
     The alternative is to use a zeroconf/avahi daemon to register the ROS 
     master as service and discover other ROS masters.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
