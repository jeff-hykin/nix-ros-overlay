
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, image-geometry, joint-states-settler, message-filters, settlerlib }:
buildRosPackage {
  pname = "ros-melodic-laser-joint-processor";
  version = "1.0.11-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_calibration-release";
    rev = "142c316474cd0b034758aa9161616b2054ee1386";
    owner = "UNR-RoboticsResearchLab";
    sha256 = "sha256-VE3Niv4LcZUXCkWjAdGsDTw2YqAnoCsbOICOkvtXC0Y=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs image-geometry joint-states-settler message-filters settlerlib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Computes joint angles associated with a specific set of detected checkerboard corners.
     This package is experimental and unstable.
     Expect its APIs to change.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
