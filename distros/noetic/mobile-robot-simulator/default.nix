
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, nav-msgs, roscpp, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-noetic-mobile-robot-simulator";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mobile_robot_simulator-release";
    rev = "86d195111bcbc3a193718389f4eaef2c55d29dfe";
    owner = "nobleo";
    sha256 = "sha256-Oq0f6dDI4QyXSeXB4S3He1oni35peRzDBLchC0GpvME=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs roscpp sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The mobile_robot_simulator package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
