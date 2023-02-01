
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, geometry-msgs, mesh-msgs, tf }:
buildRosPackage {
  pname = "ros-noetic-mesh-msgs-transform";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mesh-tools";
    rev = "8baad9eb92decaf2b395d613e3165ac09b1ce5bd";
    owner = "uos-gbp";
    sha256 = "sha256-QHwpSWWeSQakmvluvES5XGrVT3piyt2FVjgnXXsssBM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eigen geometry-msgs mesh-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Methods to transform mesh_msgs'';
    license = with lib.licenses; [ bsd3 ];
  };
}
