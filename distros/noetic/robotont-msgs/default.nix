
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, roscpp, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-robotont-msgs";
  version = "0.0.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robotont_msgs-release";
    rev = "c7113f7a3032915e4716318d149be743977dfe69";
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
