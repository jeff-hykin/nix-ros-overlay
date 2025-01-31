
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, base-local-planner, catkin, costmap-2d, roscpp }:
buildRosPackage {
  pname = "ros-melodic-safe-teleop-base";
  version = "0.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "shared_autonomy_manipulation-release";
    rev = "2115adc560517900aa2c67042803b7f6ccaffed1";
    owner = "ros-gbp";
    sha256 = "sha256-PWojSi99sdRQ3VRURPU2A14cMUNO/wIhx5IWGtDd5Fc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ base-local-planner costmap-2d roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides automatic collision avoidance and is intended to be used for safer teleoperation of a robot base.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
