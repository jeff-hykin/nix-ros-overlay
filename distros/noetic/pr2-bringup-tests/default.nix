
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-calibration, catkin, ethercat-trigger-controllers, image-view, pr2-bringup, pr2-controller-manager, pr2-mannequin-mode }:
buildRosPackage {
  pname = "ros-noetic-pr2-bringup-tests";
  version = "1.0.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_self_test-release";
    rev = "d2dc0fda5179e3015cf273125c420d84bce610a9";
    owner = "pr2-gbp";
    sha256 = "sha256-mGA3SQ2YUu5uhY3ucL7JS3QLlFen9+Y/RhsGr+B3B9o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ camera-calibration ethercat-trigger-controllers image-view pr2-bringup pr2-controller-manager pr2-mannequin-mode ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Complete functionality tests for PR2. Contains utilities designed to test and verify devices, mechanicals and sensors.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
