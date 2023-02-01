
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, amcl, catkin, gmapping, map-server, move-base, tf, urdf, xacro }:
buildRosPackage {
  pname = "ros-melodic-mrp2-slam";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrp2_common-release";
    rev = "61e617c3e767fb8da300800c52c654ebb2716240";
    owner = "milvusrobotics";
    sha256 = "sha256-ElV4KS4ZJILHeT7GK+8nNLvYqe//5r6ZmYv6ErGh+e4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin tf ];
  propagatedBuildInputs = [ amcl gmapping map-server move-base urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch scripts for mapping operations'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
