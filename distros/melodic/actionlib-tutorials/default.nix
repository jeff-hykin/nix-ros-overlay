
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, message-generation, message-runtime, roscpp, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-actionlib-tutorials";
  version = "0.1.11";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "common_tutorials-release";
    rev = "0005da991a515a07257c37e9f2f204827fa9aa88";
    owner = "ros-gbp";
    sha256 = "sha256-E5m1k0SYBt45HseD9/JZ56DVnxDIB4ROcsdL/vcsfeU=";
  };

  buildType = "catkin";
  buildInputs = [ actionlib-msgs catkin message-generation std-msgs ];
  propagatedBuildInputs = [ actionlib message-runtime roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The actionlib_tutorials package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
