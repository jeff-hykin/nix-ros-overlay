
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages }:
buildRosPackage {
  pname = "ros-noetic-rosmake";
  version = "1.15.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros-release";
    rev = "32b0659da3765bf96089b35bcc4bb5b51299ddea";
    owner = "ros-gbp";
    sha256 = "sha256-2IUCC/gQH2T5lHpiErzVXDhOcOBWjNdp6f6+SNKy6iA=";
  };

  buildType = "catkin";
  buildInputs = [ python3Packages.setuptools ];
  propagatedBuildInputs = [ catkin python3Packages.rospkg ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''rosmake is a ros dependency aware build tool which can be used to
     build all dependencies in the correct order.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
