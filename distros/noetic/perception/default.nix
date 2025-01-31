
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, image-common, image-pipeline, image-transport-plugins, laser-pipeline, perception-pcl, ros-base, vision-opencv }:
buildRosPackage {
  pname = "ros-noetic-perception";
  version = "1.5.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "metapackages-release";
    rev = "cd18e93e2a884cbeafd22dc08d1f3498be844e3d";
    owner = "ros-gbp";
    sha256 = "sha256-01jTD7u8J1hJ6oocF/YZW+dG8aTm1NqKNMAZDsT9onA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ image-common image-pipeline image-transport-plugins laser-pipeline perception-pcl ros-base vision-opencv ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A metapackage to aggregate several packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
