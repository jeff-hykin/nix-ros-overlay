
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pluginlib, pr2-controller-interface, pr2-mechanism-controllers, pr2-mechanism-model, realtime-tools, robot-mechanism-controllers, roscpp, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-pr2-calibration-controllers";
  version = "1.10.18-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_controllers-release";
    rev = "ca6bcd8c03008bfb134fa2ef5aeb03f8ed18277e";
    owner = "pr2-gbp";
    sha256 = "sha256-xNihhQUis7zOI9Z5HY+KLXZaSMYCeObVHCdw0REAXVM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pluginlib pr2-controller-interface pr2-mechanism-controllers pr2-mechanism-model realtime-tools robot-mechanism-controllers roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_calibration_controllers package contains the controllers
     used to bring all the joints in the PR2 to a calibrated state.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
