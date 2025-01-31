
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-supported-robots, xacro }:
buildRosPackage {
  pname = "ros-noetic-cob-calibration-data";
  version = "0.6.18-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_calibration_data-release";
    rev = "053841702feff535100ced2c1b577a6420c051cf";
    owner = "ipa320";
    sha256 = "sha256-gBb+CDfr7ZsrfItMjvODMkEZKfy7W1CZ8rbxtCikQPE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cob-supported-robots ];
  propagatedBuildInputs = [ xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This repository holds the current calibration data for Care-O-bot.'';
    license = with lib.licenses; [ asl20 ];
  };
}
