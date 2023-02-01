
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-visualization-marker-tutorials";
  version = "0.10.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_tutorials-release";
    rev = "35a5a4fe72d3ff922aa107d02d86991293f9912c";
    owner = "ros-gbp";
    sha256 = "sha256-yqAYU3k+t8Wjs58xm0DLyWn4rnZSW7MtDPzPrYX2leY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The visulalization_marker_tutorials package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
