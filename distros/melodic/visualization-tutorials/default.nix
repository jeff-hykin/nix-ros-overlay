
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, interactive-marker-tutorials, librviz-tutorial, rviz-plugin-tutorials, rviz-python-tutorial, visualization-marker-tutorials }:
buildRosPackage {
  pname = "ros-melodic-visualization-tutorials";
  version = "0.10.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_tutorials-release";
    rev = "a439ae0dca0756df78478b730254ca6ef8044402";
    owner = "ros-gbp";
    sha256 = "sha256-OBDRBPhdGLZ4qcx1P3NyRqF6tQdgyGBIGCGkLEkI3Qw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ interactive-marker-tutorials librviz-tutorial rviz-plugin-tutorials rviz-python-tutorial visualization-marker-tutorials ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage referencing tutorials related to rviz and visualization.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
