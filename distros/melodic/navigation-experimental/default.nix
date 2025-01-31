
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, assisted-teleop, catkin, goal-passer, pose-base-controller, pose-follower, sbpl-lattice-planner, sbpl-recovery, twist-recovery }:
buildRosPackage {
  pname = "ros-melodic-navigation-experimental";
  version = "0.3.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_experimental-release";
    rev = "fbb9865558101e5d44bfacc66a26b988b9ff4510";
    owner = "ros-gbp";
    sha256 = "sha256-pM1AKaSPlKjEPM1bRGcFFtGWlgVCZsNqNKnXA6W3/Ns=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ assisted-teleop goal-passer pose-base-controller pose-follower sbpl-lattice-planner sbpl-recovery twist-recovery ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A collection of navigation plugins and tools: Various recovery behaviors,
    local and global planner plugins for move_base, a teleop filter for
    obstacle avoidance, a simple control-based move_base replacement
    etc.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
