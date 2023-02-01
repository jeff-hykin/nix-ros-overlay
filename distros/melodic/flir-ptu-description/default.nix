
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, urdf, xacro }:
buildRosPackage {
  pname = "ros-melodic-flir-ptu-description";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "flir_ptu-release";
    rev = "7508f0e3729f931c0f649d6f0a5401b20f358695";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-ky1vfozo7sK7HuZqM12xQzM2PPrGePCpbmNYp/6c/Vw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''URDF description the FLIR PTUs, currently the D46.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
