
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-calibration-parsers, catkin, geometry-msgs, roscpp, sensor-msgs, std-msgs, visp }:
buildRosPackage {
  pname = "ros-noetic-visp-bridge";
  version = "0.13.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vision_visp-release";
    rev = "00a5b5694f71b83dba5fd1f367d4bda13c354b01";
    owner = "lagadic";
    sha256 = "sha256-ilGOn5lEKk+au6RUDrlJE6dWIvZCgwvzQlhuSfTY8kA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ camera-calibration-parsers geometry-msgs roscpp sensor-msgs std-msgs visp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Converts between ROS structures and ViSP structures.'';
    license = with lib.licenses; [ "GPL-2.0-only" ];
  };
}
