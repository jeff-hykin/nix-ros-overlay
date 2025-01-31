
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, lvr2, mesh-msgs, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-mesh-msgs-conversions";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mesh-tools";
    rev = "7634b5e10b43c2f3786ae50adc6b9dace393d617";
    owner = "uos-gbp";
    sha256 = "sha256-QcWLafcS/hIPlcSTItRswYYpQlIgUr75HmrrFSrJZ0g=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ lvr2 mesh-msgs roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''converts point clouds and attributes into meshes and mesh attributes'';
    license = with lib.licenses; [ bsd3 ];
  };
}
