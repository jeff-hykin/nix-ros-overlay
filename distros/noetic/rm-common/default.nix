
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, control-msgs, controller-manager-msgs, dynamic-reconfigure, eigen, geometry-msgs, imu-complementary-filter, imu-filter-madgwick, realtime-tools, rm-msgs, roscpp, roslint, tf }:
buildRosPackage {
  pname = "ros-noetic-rm-common";
  version = "0.1.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rm_control-release";
    rev = "42bf9742b06bee74712f0bc9a1cac5ec99366d67";
    owner = "rm-controls";
    sha256 = "sha256-XC3GuL6pHX7EFBW7cMRNdndsweWVlItND9Jp92JQ924=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ control-msgs controller-manager-msgs dynamic-reconfigure eigen geometry-msgs imu-complementary-filter imu-filter-madgwick realtime-tools rm-msgs roscpp roslint tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rm_common package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
