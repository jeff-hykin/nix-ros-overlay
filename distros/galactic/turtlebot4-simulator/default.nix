
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, turtlebot4-ignition-bringup, turtlebot4-ignition-gui-plugins, turtlebot4-ignition-toolbox }:
buildRosPackage {
  pname = "ros-galactic-turtlebot4-simulator";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot4_simulator-release";
    rev = "7924db0a0835db0e64500c9a8b1e569b2dd1f265";
    owner = "ros2-gbp";
    sha256 = "sha256-tKC4YR+CHRptWNa8AYVX2SatMQPW+9MP+YneG/PlXUg=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot4-ignition-bringup turtlebot4-ignition-gui-plugins turtlebot4-ignition-toolbox ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''TODO: Package description'';
    license = with lib.licenses; [ asl20 ];
  };
}
