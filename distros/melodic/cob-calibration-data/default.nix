
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-supported-robots, xacro }:
buildRosPackage {
  pname = "ros-melodic-cob-calibration-data";
  version = "0.6.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_calibration_data-release";
    rev = "1f2686e63f213ea96ba57fd006eb59ce618e62a0";
    owner = "ipa320";
    sha256 = "sha256-NIWh8akvDbL1gnTHx/PlH3Ma8FDJ45NO96SWzccE9SI=";
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
