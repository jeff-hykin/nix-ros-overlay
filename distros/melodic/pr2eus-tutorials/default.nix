
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, jsk-interactive-marker, jsk-pcl-ros, pr2eus, roseus-tutorials }:
buildRosPackage {
  pname = "ros-melodic-pr2eus-tutorials";
  version = "0.3.14-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_pr2eus-release";
    rev = "446c17a82fc15af80974345f630d3b9b8a420469";
    owner = "tork-a";
    sha256 = "sha256-CWuDwOQuod+AbJwVizq2SmlOmIppTC7W33RPsvVRfl0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ jsk-interactive-marker jsk-pcl-ros pr2eus roseus-tutorials ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''pr2eus_tutorials'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
