
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, can-msgs, catkin, dataspeed-ulc-msgs, geometry-msgs, nodelet, python3Packages, roscpp, roslib, rospy, rostest, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-dataspeed-ulc-can";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dataspeed_ulc_ros-release";
    rev = "88cc584333bbb0265d2eb0aea24ed78153f8d35c";
    owner = "DataspeedInc-release";
    sha256 = "sha256-TXMu+fqYixQX9l5P7ZBzr1d7Gsr1XcPldWqHkDXGXwg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin python3Packages.setuptools ];
  checkInputs = [ roslib rostest ];
  propagatedBuildInputs = [ can-msgs dataspeed-ulc-msgs geometry-msgs nodelet roscpp rospy std-msgs ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''Package to translate ROS messages to and from CAN messages to interact with the Universal Lat/Lon Controller (ULC) firmware'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
