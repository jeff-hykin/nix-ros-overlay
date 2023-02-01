
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages }:
buildRosPackage {
  pname = "ros-noetic-drone-circuit-assets";
  version = "1.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "drones-release";
    rev = "46392048a3d45c4defab58411fb6f9a12fd16c5c";
    owner = "JdeRobot";
    sha256 = "sha256-G5br8VoFvZnNBH3LKoScfsHiPyNdHP4N9o0iDAgLAGg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin python3Packages.setuptools ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''The JdeRobot Behavior Metrics drone assets package'';
    license = with lib.licenses; [ mit ];
  };
}
