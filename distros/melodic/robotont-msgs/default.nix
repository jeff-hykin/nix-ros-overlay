
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, roscpp, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-robotont-msgs";
  version = "0.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robotont_msgs-release";
    rev = "35552985daf8b3d61b26bee5a0d2b29b62079556";
    owner = "robotont-release";
    sha256 = "sha256-A37dFaxRXwDBPU94C/LW59YNeZes/EZdUHOKQEr0n7E=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime roscpp rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The robotont_msgs package'';
    license = with lib.licenses; [ asl20 ];
  };
}
