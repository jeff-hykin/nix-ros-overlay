
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, kdl-parser, p2os-driver, p2os-msgs, sensor-msgs, std-msgs, tf, urdf }:
buildRosPackage {
  pname = "ros-noetic-p2os-urdf";
  version = "2.2.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "p2os-release";
    rev = "636fd8b74de0cf9e43eaf4a129f05bece4d9f20c";
    owner = "allenh1";
    sha256 = "sha256-G1fdIrSYwIvWAiIZZ/j5TuS07qSH/4m+dsxArUGza3E=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs kdl-parser p2os-driver p2os-msgs sensor-msgs std-msgs tf urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''URDF file descriptions for P2OS/ARCOS robot'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
