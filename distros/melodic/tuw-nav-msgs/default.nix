
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, nav-msgs, roscpp, rospy, std-msgs, tf, tuw-geometry-msgs }:
buildRosPackage {
  pname = "ros-melodic-tuw-nav-msgs";
  version = "0.0.13";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tuw_msgs-release";
    rev = "a39f0d6c59761b8cddd5756920e70a8433283eab";
    owner = "tuw-robotics";
    sha256 = "sha256-9KR3r4CW5MbqfZCqpXM+SVylhCIzGUNEEYeub1Jrw+c=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime nav-msgs roscpp rospy std-msgs tf tuw-geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The tuw_nav_msgs package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
