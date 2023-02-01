
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, amcl, catkin, map-server, move-base, stage-ros, teb-local-planner }:
buildRosPackage {
  pname = "ros-melodic-teb-local-planner-tutorials";
  version = "0.2.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "teb_local_planner_tutorials-release";
    rev = "659bb8b80533b0d7581a2cf06c1bd966bb949257";
    owner = "rst-tu-dortmund";
    sha256 = "sha256-YT/10QNfUpXEzpyOqioa1CQ2IhIyesO+M2kh5gYDct8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ amcl map-server move-base stage-ros teb-local-planner ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The teb_local_planner_tutorials package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
