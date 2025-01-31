
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, fuse-constraints, fuse-core, fuse-doc, fuse-graphs, fuse-models, fuse-msgs, fuse-optimizers, fuse-publishers, fuse-variables, fuse-viz }:
buildRosPackage {
  pname = "ros-noetic-fuse";
  version = "0.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fuse-release";
    rev = "038d838e8fceef04bc8cf492768fd3ee952ed046";
    owner = "locusrobotics";
    sha256 = "sha256-fNIeOlL9jLL3OzEUoCbxsQw5E7Cda+T8uGkNJFWBnAc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ fuse-constraints fuse-core fuse-doc fuse-graphs fuse-models fuse-msgs fuse-optimizers fuse-publishers fuse-variables fuse-viz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The fuse metapackage'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
