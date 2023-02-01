
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-build, ecl-config, ecl-exceptions, ecl-formatters, ecl-linear-algebra, geometry-msgs, roscpp, tf }:
buildRosPackage {
  pname = "ros-melodic-yocs-math-toolkit";
  version = "0.8.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yujin_ocs-release";
    rev = "aa4dbb28d2d5ea4540255ea34f2c4e21ab01652d";
    owner = "yujinrobot-release";
    sha256 = "sha256-J9FBvfxSFaDwyWh+Fwy466gVP2VQWY9l5wMc7wZj7Zs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-exceptions ecl-formatters ecl-linear-algebra geometry-msgs roscpp tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Math toolkit for Yujin open control system. This package is intended to contain common use functions,
    mostly for simple mathematics but also for tf-related conversions.
    By no means it pretends to be an efficient and robust, widely used math library, but a play ground where
    to put common code that is typically repeated in many robot control programs.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
