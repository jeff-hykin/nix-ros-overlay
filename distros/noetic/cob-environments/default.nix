
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-default-env-config }:
buildRosPackage {
  pname = "ros-noetic-cob-environments";
  version = "0.6.13-r1";

  src = fetchurl {
    url = "https://github.com/ipa320/cob_environments-release/archive/3e0c82179e7505dafc6a25a07516adc0203bb13a.tar.gz";
    sha256 = "sha256-gRBKpUiT1RWHji/bzUwFSqDeiuC8YS1FG0ocmBtCiBA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-default-env-config ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This stack holds packages for IPA default environment configuration.'';
    license = with lib.licenses; [ asl20 ];
  };
}
