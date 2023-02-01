
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, moveit-core, moveit-ros-planning-interface, roscpp, tf2-geometry-msgs }:
buildRosPackage {
  pname = "ros-melodic-pincher-arm-moveit-demos";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pincher_arm-release";
    rev = "5c6dad7b5d26d4bf2fcadb169dd5d8e52bda5115";
    owner = "fictionlab-gbp";
    sha256 = "sha256-+pmwb0EqJTb2bQ6M/HmLmQWdJ61qq2y5s2T6big7ix0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ moveit-core moveit-ros-planning-interface roscpp tf2-geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Moveit demos for the PhantomX Pincher arm.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
