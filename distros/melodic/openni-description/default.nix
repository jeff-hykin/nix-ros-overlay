
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rostest, urdf, urdfdom, xacro }:
buildRosPackage {
  pname = "ros-melodic-openni-description";
  version = "1.11.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "openni_camera-release";
    rev = "e45cdcd308a6796c5001a1c64c63fc0e4bbdc777";
    owner = "ros-gbp";
    sha256 = "sha256-mW4AMBSFtuaRDAZ6puWpGX3N95MAnIzsaVqs6a19P5I=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest urdfdom ];
  propagatedBuildInputs = [ urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Model files of OpenNI device.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
