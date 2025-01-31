
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, console-bridge }:
buildRosPackage {
  pname = "ros-noetic-cpp-common";
  version = "0.7.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roscpp_core-release";
    rev = "e73b1bc7bd4e7e6cbcffddbfc498c03a58974034";
    owner = "ros-gbp";
    sha256 = "sha256-CUSuPUvvjwN5srdZnIBG45wKkHh680//1UcyjzR1mQQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost console-bridge ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''cpp_common contains C++ code for doing things that are not necessarily ROS
    related, but are useful for multiple packages. This includes things like
    the ROS_DEPRECATED and ROS_FORCE_INLINE macros, as well as code for getting
    backtraces.

    This package is a component of <a href="http://www.ros.org/wiki/roscpp">roscpp</a>.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
