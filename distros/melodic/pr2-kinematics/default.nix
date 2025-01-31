
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pr2-arm-kinematics }:
buildRosPackage {
  pname = "ros-melodic-pr2-kinematics";
  version = "1.0.10";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_kinematics-release";
    rev = "276360e58f41d2e80f1c8d3ecb11bac66e169cad";
    owner = "pr2-gbp";
    sha256 = "sha256-zBNA2O/k0++V1AEvjIlkuyKZIaMqLPhr3xfj2D/RL7g=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pr2-arm-kinematics ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_kinematics package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
