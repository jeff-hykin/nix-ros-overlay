
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ceres-solver, fuse-core, pluginlib, roscpp, roslint, rostest }:
buildRosPackage {
  pname = "ros-melodic-fuse-variables";
  version = "0.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fuse-release";
    rev = "b19ab5159b53ccccd6842dd1c509e4905aa23339";
    owner = "locusrobotics";
    sha256 = "sha256-kjU7t41ZU92TGpGUx9YQeRed1YH90trjYgWlnydKLww=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint rostest ];
  propagatedBuildInputs = [ ceres-solver fuse-core pluginlib roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The fuse_variables package provides a set of commonly used variable types, such as 2D and 3D positions,
    orientations, velocities, and accelerations.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
