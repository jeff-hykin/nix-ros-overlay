
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, common-tutorials, geometry-tutorials, robot, ros-tutorials, roslint, urdf-tutorial, visualization-tutorials, viz }:
buildRosPackage {
  pname = "ros-melodic-desktop";
  version = "1.4.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "metapackages-release";
    rev = "d19f4d8dcee6f8f155a7db53ae972f9409bb26f5";
    owner = "ros-gbp";
    sha256 = "sha256-kdth0D9c1qDEQxDTRk8f9UK43u5h3NDkmUBVK+5j6W0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ angles common-tutorials geometry-tutorials robot ros-tutorials roslint urdf-tutorial visualization-tutorials viz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A metapackage to aggregate several packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
