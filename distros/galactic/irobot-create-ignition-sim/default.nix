
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, irobot-create-ignition-bringup, irobot-create-ignition-plugins, irobot-create-ignition-toolbox }:
buildRosPackage {
  pname = "ros-galactic-irobot-create-ignition-sim";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "create3_sim-release";
    rev = "09e4703256f0830ba50e3fbeac0f93ccc7694dc7";
    owner = "ros2-gbp";
    sha256 = "sha256-aSpbNGLu/8W09SH5iOAXYtN5g+zjpbaSeBVZri+tO0U=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-ignition-bringup irobot-create-ignition-plugins irobot-create-ignition-toolbox ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Metapackage for the iRobot(R) Create(R) 3 robot Ignition simulator'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
