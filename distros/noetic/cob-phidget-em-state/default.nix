
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-msgs, cob-phidgets, rospy }:
buildRosPackage {
  pname = "ros-noetic-cob-phidget-em-state";
  version = "0.7.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_driver-release";
    rev = "3656ab19695ee7553f917ae825728b0f9dadb2d0";
    owner = "ipa320";
    sha256 = "sha256-emDLRsItKLKFdv9xyFRtKaUmz5/IvuSld9ykG9PqGNQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-msgs cob-phidgets rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The cob_phidget_em_state package publishes emergency state based on phidgets signals.'';
    license = with lib.licenses; [ asl20 ];
  };
}
