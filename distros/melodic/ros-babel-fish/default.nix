
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, geometry-msgs, openssl, ros-babel-fish-test-msgs, rosapi, roscpp, roscpp-tutorials, rosgraph-msgs, roslib, rostest, std-msgs, std-srvs, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-ros-babel-fish";
  version = "0.9.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_babel_fish-release";
    rev = "200405999284af2a6189ccbfb7cf74b8c17ee9b5";
    owner = "StefanFabian";
    sha256 = "sha256-+xeOjDeg3TplCq9bs36KVK4svNzdUIPrFfutRjE1gCA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ geometry-msgs ros-babel-fish-test-msgs rosapi roscpp-tutorials rosgraph-msgs rostest std-msgs std-srvs visualization-msgs ];
  propagatedBuildInputs = [ actionlib openssl roscpp roslib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A runtime message handler for ROS.
    Allows subscription, publishing, calling of services and actions with messages known only at runtime.'';
    license = with lib.licenses; [ mit ];
  };
}
