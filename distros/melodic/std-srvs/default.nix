
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime }:
buildRosPackage {
  pname = "ros-melodic-std-srvs";
  version = "1.11.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_comm_msgs-release";
    rev = "5854e60d75557d0d63885761ca5e1544a1ccb7b8";
    owner = "ros-gbp";
    sha256 = "sha256-Rxvgnd+wVrrWDeABFUnr5bIN96c7qK4ky4pA2lcALNM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Common service definitions.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
