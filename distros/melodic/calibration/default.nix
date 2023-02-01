
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, calibration-estimation, calibration-launch, calibration-msgs, catkin, image-cb-detector, interval-intersection, joint-states-settler, laser-cb-detector, monocam-settler, settlerlib }:
buildRosPackage {
  pname = "ros-melodic-calibration";
  version = "0.10.14";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "calibration-release";
    rev = "97c9824dd5cc96c20b20ce4e452937a2d6ad6988";
    owner = "ros-gbp";
    sha256 = "sha256-dRPU4pjdJhjPoccIc1AgBZu+nxDE9AHTTrE5wbuYVwM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ calibration-estimation calibration-launch calibration-msgs image-cb-detector interval-intersection joint-states-settler laser-cb-detector monocam-settler settlerlib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides a toolchain running through the robot calibration process. This
     involves capturing calibration data, estimating parameters, and
     then updating the URDF.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
