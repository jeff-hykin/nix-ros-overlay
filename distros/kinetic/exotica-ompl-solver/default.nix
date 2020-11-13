
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, exotica-core, exotica-python, ompl }:
buildRosPackage {
  pname = "ros-kinetic-exotica-ompl-solver";
  version = "6.0.0-r1";

  src = fetchurl {
    url = "https://github.com/ipab-slmc/exotica-release/archive/release/kinetic/exotica_ompl_solver/6.0.0-1.tar.gz";
    name = "6.0.0-1.tar.gz";
    sha256 = "297d342d1f53df3943da86288efb9537b6fba84cde3b16ccd9aba89cdb8006f6";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ exotica-core exotica-python ompl ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Exotica solvers based on the Open Motion Planning Libary (OMPL)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
