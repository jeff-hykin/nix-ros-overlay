
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ridgeback-gazebo }:
buildRosPackage {
  pname = "ros-melodic-ridgeback-simulator";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ridgeback_simulator-release";
    rev = "377e4e0ab847308f4fc6f60c4cb40df36198d58b";
    owner = "clearpath-gbp";
    sha256 = "sha256-Ljvvf3tFBaZks4686NSWZEe2NI3f5d5CgH3hHr8XWLA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ridgeback-gazebo ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Packages for simulating Ridgeback.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
