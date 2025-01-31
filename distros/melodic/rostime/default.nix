
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cpp-common }:
buildRosPackage {
  pname = "ros-melodic-rostime";
  version = "0.6.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roscpp_core-release";
    rev = "afc7bb77ed0147e9f29309f78699c83b159f2a3d";
    owner = "ros-gbp";
    sha256 = "sha256-qeH828b+c4uuHXk/roIoqkUzVBVt3j3BAbfT5gfXYS4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost cpp-common ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Time and Duration implementations for C++ libraries, including roscpp.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
