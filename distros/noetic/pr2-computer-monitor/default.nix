
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-msgs, pr2-msgs, roscpp, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-pr2-computer-monitor";
  version = "1.6.32-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_robot-release";
    rev = "23158ca46fa8481709bf11d477996421e198b888";
    owner = "pr2-gbp";
    sha256 = "sha256-KPpfeNoL1FaYJS2I2CpxIrqCqULQlC0/6qoSB1bT4Ag=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ diagnostic-msgs pr2-msgs roscpp rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Monitors the computer's processor and hard drives of the PR2 and publishes data to diagnostics.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
