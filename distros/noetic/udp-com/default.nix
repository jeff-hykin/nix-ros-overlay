
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, nodelet, roscpp, roslint, rostest, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-udp-com";
  version = "1.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "udp_com-release";
    rev = "3b18e9330f8c841161fb6e403d5208a002100d89";
    owner = "flynneva";
    sha256 = "sha256-/+NB3JgSv1jewDwinkKvkUoa/+BT6++94bgZcIpyYk8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint rostest ];
  propagatedBuildInputs = [ message-generation message-runtime nodelet roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Generic UDP communication ROS package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
