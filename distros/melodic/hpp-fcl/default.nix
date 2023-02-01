
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, assimp, boost, catkin, cmake, doxygen, eigen, eigenpy, git, octomap, python, pythonPackages }:
buildRosPackage {
  pname = "ros-melodic-hpp-fcl";
  version = "2.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hpp-fcl-ros-release";
    rev = "192f3a63baf1b0bc7e7c785be0faf600e22f070b";
    owner = "humanoid-path-planner";
    sha256 = "sha256-Jg/himo9KLlbAM9hVexTrYyJ/m9rxp3+R5fhfXgRbJM=";
  };

  buildType = "cmake";
  buildInputs = [ cmake doxygen git pythonPackages.lxml ];
  propagatedBuildInputs = [ assimp boost catkin eigen eigenpy octomap python pythonPackages.numpy ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''An extension of the Flexible Collision Library.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
