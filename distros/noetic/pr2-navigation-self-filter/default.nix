
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, assimp, bullet, catkin, filters, pcl-ros, resource-retriever, roscpp, sensor-msgs, tf, urdf, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-pr2-navigation-self-filter";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_navigation-release";
    rev = "26d84e5edbde9d4263cc52fbb4aa771cd14200e7";
    owner = "pr2-gbp";
    sha256 = "sha256-IdOf6HmO0M7GOPWRbHkTCr99n1pt18N1e6Dx1AQV4vU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ assimp bullet filters pcl-ros resource-retriever roscpp sensor-msgs tf urdf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Filters the robot's body out of point clouds.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
