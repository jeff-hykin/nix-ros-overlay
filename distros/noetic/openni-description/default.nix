
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rostest, urdf, urdfdom, xacro }:
buildRosPackage {
  pname = "ros-noetic-openni-description";
  version = "1.11.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "openni_camera-release";
    rev = "d97cf77768495e1c314ba7a8f68ba91c6e30856d";
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
