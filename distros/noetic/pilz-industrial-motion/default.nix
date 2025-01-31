
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pilz-industrial-motion-planner, pilz-msgs, pilz-robot-programming }:
buildRosPackage {
  pname = "ros-noetic-pilz-industrial-motion";
  version = "0.5.0-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pilz_industrial_motion-release";
    rev = "cc02300f49b5e767cc10297fb15653cf6d3dac86";
    owner = "PilzDE";
    sha256 = "sha256-BOeRT3u4HNEu3hpWuvSeIxQoiV/eW4MwFflWLoxkV0c=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pilz-industrial-motion-planner pilz-msgs pilz-robot-programming ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pilz_industrial_motion package'';
    license = with lib.licenses; [ asl20 ];
  };
}
