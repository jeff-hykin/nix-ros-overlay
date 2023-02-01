
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, eigen, message-generation, message-runtime, roscpp, roslib }:
buildRosPackage {
  pname = "ros-noetic-parameter-pa";
  version = "1.2.3-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_parameter-release";
    rev = "0130634c08bce81d68cc861298470387332505f1";
    owner = "TUC-ProAut";
    sha256 = "sha256-UdbuPA4pBgqHS9lkFd5d5E3khQw6fDibj40vHZiThAM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ cmake-modules eigen message-runtime roscpp roslib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ProAut parameter package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
