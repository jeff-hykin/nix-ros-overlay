
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-calibration-parsers, catkin, geometry-msgs, message-generation, message-runtime, roscpp, rqt-console, sensor-msgs, std-msgs, visp, visp-bridge }:
buildRosPackage {
  pname = "ros-noetic-visp-camera-calibration";
  version = "0.13.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vision_visp-release";
    rev = "a3ae71a56e123aa0ac7c4edd97a130a6ea952dea";
    owner = "lagadic";
    sha256 = "sha256-Y6p4CmBsnWXP6u7pfQymLdNg4+g+K62eRIM1xmt+Mnc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ camera-calibration-parsers geometry-msgs message-generation message-runtime roscpp rqt-console sensor-msgs std-msgs visp visp-bridge ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''visp_camera_calibration allows easy calibration of
     cameras using a customizable pattern and ViSP library.'';
    license = with lib.licenses; [ "GPL-2.0-only" ];
  };
}
