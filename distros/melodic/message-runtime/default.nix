
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cpp-common, genpy, roscpp-serialization, roscpp-traits, rostime }:
buildRosPackage {
  pname = "ros-melodic-message-runtime";
  version = "0.4.12";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "message_runtime-release";
    rev = "80b7354d834b0ba6e32df03c2ff5f4ca6f2d92e6";
    owner = "ros-gbp";
    sha256 = "sha256-HoP8ImTvmlfgIm3C0qwAr5njF2HjPQ44kO/srMIFBlY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cpp-common genpy roscpp-serialization roscpp-traits rostime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package modeling the run-time dependencies for language bindings of messages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
