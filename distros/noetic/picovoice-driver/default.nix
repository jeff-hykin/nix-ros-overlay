
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, ddynamic-reconfigure, libsndfile, libyamlcpp, picovoice-msgs, roscpp, roslib }:
buildRosPackage {
  pname = "ros-noetic-picovoice-driver";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "picovoice_ros-release";
    rev = "928d2a1de68d22e9f7b9cd7568f9f2784802b517";
    owner = "reinzor";
    sha256 = "sha256-6k/xh6FZiEcOQoJQ8N08H/rv3IARVwwsY5IQYXfrXwU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib ddynamic-reconfigure libsndfile libyamlcpp picovoice-msgs roscpp roslib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS Wrappers for the Picovoice libraries'';
    license = with lib.licenses; [ asl20 ];
  };
}
