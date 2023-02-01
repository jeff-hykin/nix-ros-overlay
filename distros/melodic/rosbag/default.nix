
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cpp-common, genmsg, genpy, pythonPackages, rosbag-storage, rosconsole, roscpp, roscpp-serialization, roslib, rospy, std-srvs, topic-tools, xmlrpcpp }:
buildRosPackage {
  pname = "ros-melodic-rosbag";
  version = "1.14.13-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_comm-release";
    rev = "5e450c831d5557eb48e30dd910ad5daf618a1c5c";
    owner = "ros-gbp";
    sha256 = "sha256-f/0lDF2WFUTfADtl1vczQY2ZaFon7qt8pZbL+ySd/Z0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cpp-common pythonPackages.pillow roscpp-serialization ];
  propagatedBuildInputs = [ boost genmsg genpy pythonPackages.pycryptodomex pythonPackages.python-gnupg pythonPackages.rospkg rosbag-storage rosconsole roscpp roslib rospy std-srvs topic-tools xmlrpcpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This is a set of tools for recording from and playing back to ROS
    topics.  It is intended to be high performance and avoids
    deserialization and reserialization of the messages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
