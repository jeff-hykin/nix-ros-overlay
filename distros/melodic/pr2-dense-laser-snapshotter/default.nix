
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dense-laser-assembler, pr2-msgs }:
buildRosPackage {
  pname = "ros-melodic-pr2-dense-laser-snapshotter";
  version = "1.0.11-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_calibration-release";
    rev = "30cb2cd53549fab6fefbffe18fa25785661dfebc";
    owner = "UNR-RoboticsResearchLab";
    sha256 = "sha256-pJxLInUGSN9oRHZPGFEq9YYSg7VknFFV7uWc8Q+ZoYk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dense-laser-assembler pr2-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Stores the data from a series of laser scan messages in a dense representation, allowing
     users to easily perform image-like operations on intensity or range data. This package is
     experimental. Expect APIs to change.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
