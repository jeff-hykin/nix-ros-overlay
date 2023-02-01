
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, allocators, catkin, rosatomic, rosconsole, roslib }:
buildRosPackage {
  pname = "ros-noetic-lockfree";
  version = "1.0.25-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_realtime-release";
    rev = "1fc8d5d7e74122b7d636db95bc9d6fb86b22a7b4";
    owner = "ros-gbp";
    sha256 = "sha256-/CwUQED0MsIv35TlfO0WPspHfG0BOg1NMCOoC+HKSH0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ allocators rosatomic rosconsole roslib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The lockfree package contains lock-free data structures for use in multithreaded programming.  These
     kinds of data structures are generally not as easy to use as single-threaded equivalents, and are not
     always faster.  If you don't know you need to use one, try another structure with a lock around it
     first.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
