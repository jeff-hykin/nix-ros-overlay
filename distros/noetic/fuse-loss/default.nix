
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ceres-solver, fuse-core, libsForQt5, pluginlib, qt5, roscpp, roslint }:
buildRosPackage {
  pname = "ros-noetic-fuse-loss";
  version = "0.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fuse-release";
    rev = "40b1eb39343cfd69715e213b149745fbfb95010d";
    owner = "locusrobotics";
    sha256 = "sha256-tE+1qXZugUfiPNEUYhwJ9beyqP0ZcSc2fCHB8C3+xU0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ libsForQt5.qwt qt5.qtbase roslint ];
  propagatedBuildInputs = [ ceres-solver fuse-core pluginlib roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The fuse_loss package provides a set of commonly used loss functions, such as the basic ones provided by Ceres.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
