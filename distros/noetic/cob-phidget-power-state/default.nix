
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-msgs, cob-phidgets, rospy }:
buildRosPackage {
  pname = "ros-noetic-cob-phidget-power-state";
  version = "0.7.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_driver-release";
    rev = "bca8956b127fb1d647cb578655648afc4dd28ca7";
    owner = "ipa320";
    sha256 = "sha256-5sMqaHP7sTtzpKFqbG4N0hCBVm0nwEE5oeNJkEokI6Y=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-msgs cob-phidgets rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The cob_phidget_power_state package publishes power state based on phidgets signals.'';
    license = with lib.licenses; [ asl20 ];
  };
}
