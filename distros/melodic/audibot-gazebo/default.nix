
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, audibot-description, catkin, gazebo-ros, gazebo-ros-pkgs, nav-msgs, robot-state-publisher, roscpp, rospy, rostest, rviz, tf2-geometry-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-melodic-audibot-gazebo";
  version = "0.2.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "audibot-release";
    rev = "afe10273668488448817181485b402efa7b2c636";
    owner = "robustify";
    sha256 = "sha256-kLudYnhJaw9x3YAGfujkERcI6069582ssOGyp/PLk5M=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rospy rostest ];
  propagatedBuildInputs = [ audibot-description gazebo-ros gazebo-ros-pkgs nav-msgs robot-state-publisher roscpp rviz tf2-geometry-msgs tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Gazebo model plugin to simulate Audibot'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
