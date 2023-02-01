
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-threads, geometry-msgs, nodelet, pluginlib, roscpp, sensor-msgs, std-msgs, yocs-controllers }:
buildRosPackage {
  pname = "ros-melodic-yocs-safety-controller";
  version = "0.8.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yujin_ocs-release";
    rev = "fad89417e6c8f10e01de67394a075a52d5cf0169";
    owner = "yujinrobot-release";
    sha256 = "sha256-8KHTvBhERq/6a7hM7znUzqdT1+8tc9ocz0awa0o/8lA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-threads geometry-msgs nodelet pluginlib roscpp sensor-msgs std-msgs yocs-controllers ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A controller ensuring the safe operation of your robot.

    The SafetyController listens to ranger readings in order to stop (and move back), if obstacles get to close.

    This controller can be enabled/disabled.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
