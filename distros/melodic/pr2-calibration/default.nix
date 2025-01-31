
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dense-laser-assembler, laser-joint-processor, laser-joint-projector, pr2-calibration-launch, pr2-dense-laser-snapshotter, pr2-se-calibration-launch }:
buildRosPackage {
  pname = "ros-melodic-pr2-calibration";
  version = "1.0.11-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_calibration-release";
    rev = "7bafec45ad80badc9cd26cd676049ae574ecabe7";
    owner = "UNR-RoboticsResearchLab";
    sha256 = "sha256-pUboVSJPz7fgIzF0WgdEmDOhS8QDOy3FytJhk6gTf+k=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dense-laser-assembler laser-joint-processor laser-joint-projector pr2-calibration-launch pr2-dense-laser-snapshotter pr2-se-calibration-launch ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_calibration package'';
    license = with lib.licenses; [ "TODO-CATKIN-PACKAGE-LICENSE" ];
  };
}
