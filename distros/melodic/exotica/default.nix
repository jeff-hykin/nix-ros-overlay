
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, exotica-aico-solver, exotica-collision-scene-fcl-latest, exotica-core, exotica-core-task-maps, exotica-ik-solver, exotica-levenberg-marquardt-solver, exotica-ompl-solver, exotica-python, exotica-time-indexed-rrt-connect-solver }:
buildRosPackage {
  pname = "ros-melodic-exotica";
  version = "6.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "exotica-release";
    rev = "c627cbd8d2d87f0b29f8227588491b94946a4787";
    owner = "ipab-slmc";
    sha256 = "sha256-EMvZOSauwNKhUlur+T3Bn7rDI0oFyhOhDPQGhd0TkUo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ exotica-aico-solver exotica-collision-scene-fcl-latest exotica-core exotica-core-task-maps exotica-ik-solver exotica-levenberg-marquardt-solver exotica-ompl-solver exotica-python exotica-time-indexed-rrt-connect-solver ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The Extensible Optimization Toolset (EXOTica) is a library for defining problems for robot motion planning. This package serves similar to a metapackage and contains dependencies onto all core-released exotica packages. It also builds the documentation.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
