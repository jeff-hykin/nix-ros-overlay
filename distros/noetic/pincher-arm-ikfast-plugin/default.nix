
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen-conversions, liblapack, moveit-core, pluginlib, roscpp, tf2-eigen, tf2-kdl }:
buildRosPackage {
  pname = "ros-noetic-pincher-arm-ikfast-plugin";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pincher_arm-release";
    rev = "f2981083398cf37bd18154b71f90de7e82ab4566";
    owner = "fictionlab-gbp";
    sha256 = "sha256-YPMdLXfqe3HujZW+F5ShqGpKCv7F0zD+6VrVn+Uz9Rc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin tf2-eigen tf2-kdl ];
  propagatedBuildInputs = [ eigen-conversions liblapack moveit-core pluginlib roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''IKFast plugin for the PhantomX Pincher arm'';
    license = with lib.licenses; [ bsdOriginal asl20 ];
  };
}
