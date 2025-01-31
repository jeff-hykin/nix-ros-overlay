
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, laser-assembler, laser-filters, laser-geometry }:
buildRosPackage {
  pname = "ros-noetic-laser-pipeline";
  version = "1.6.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "laser_pipeline-release";
    rev = "a48cc668e88f8b812f1ecc7d7dfffee85c2e684c";
    owner = "ros-gbp";
    sha256 = "sha256-n5HqCNf5d7ifjCxKCGTjJzbO6qjdyH+GFzAPGpT3MHo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ laser-assembler laser-filters laser-geometry ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Meta-package of libraries for processing laser data, including converting laser data
      into 3D representations.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
