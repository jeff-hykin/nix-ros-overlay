
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ar-track-alvar-msgs, catkin, geometry-msgs, libyamlcpp, roscpp, sensor-msgs, yocs-math-toolkit }:
buildRosPackage {
  pname = "ros-melodic-yocs-ar-marker-tracking";
  version = "0.8.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yujin_ocs-release";
    rev = "e7ccbec46089bbf915f94a7df333cd9b177be941";
    owner = "yujinrobot-release";
    sha256 = "sha256-AJ0bDpou4FFFkxhGrXN8paK5oeg4LnrTq6KBbr6j3xs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ar-track-alvar-msgs geometry-msgs libyamlcpp roscpp sensor-msgs yocs-math-toolkit ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Collecting, tracking and generating statistics for ar markers from ar_track_alvar.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
