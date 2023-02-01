
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, osg-interactive-markers, osg-markers, osg-utils }:
buildRosPackage {
  pname = "ros-melodic-visualization-osg";
  version = "1.0.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_osg-release";
    rev = "9cd41d46a02c5ef7ad7163529eeacc41ebfce175";
    owner = "uji-ros-pkg";
    sha256 = "sha256-N2rsrAp6YKDNQUnUgFKbjmFQCiHc8InChpYElSdXzuE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ osg-interactive-markers osg-markers osg-utils ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''visualization_osg is a metapackage providing support for visualization of geometry using the OpenSceneGraph rendering engine.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
