
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, roscpp, rospy, std-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-marvelmind-nav";
  version = "1.0.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "marvelmind_nav-release";
    rev = "a6a5316b00e6512e0b6144257b6ed4bca61b579c";
    owner = "MarvelmindRobotics";
    sha256 = "sha256-zQ7Z2t6wcbrB7ghdCv5vS++LqYAvPpwgtPJFsprPGNs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime roscpp rospy std-msgs visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Marvelmind local navigation system'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
