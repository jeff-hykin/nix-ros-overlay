
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, openscenegraph, roscpp, roslib, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-osg-markers";
  version = "1.0.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_osg-release";
    rev = "829330d1e4c55932e88d8dd72b94ad123e8083bc";
    owner = "uji-ros-pkg";
    sha256 = "sha256-8vVUb3rFlJW7kyNMO6XyEKwwg+7M1syDvN36B929OAM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ openscenegraph roscpp roslib tf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''osg_markers can be used to create Markers geometry in OSG.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
