
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, geometry-msgs, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-nav-msgs";
  version = "1.13.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "common_msgs-release";
    rev = "36766a287d86574e7fa2b30713ddee4d3b7e9825";
    owner = "ros-gbp";
    sha256 = "sha256-4h6OxOdmcmUCXyyEtWvansDk8HFvDgj2rs74jgX1ms4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs geometry-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''nav_msgs defines the common messages used to interact with the
    <a href="http://wiki.ros.org/navigation">navigation</a> stack.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
