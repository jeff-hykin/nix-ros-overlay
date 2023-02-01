
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ocean-battery-driver, power-monitor, pr2-power-board }:
buildRosPackage {
  pname = "ros-melodic-pr2-power-drivers";
  version = "1.1.7";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_power_drivers-release";
    rev = "f66897870d3027815b75c2afe12315a73427975a";
    owner = "pr2-gbp";
    sha256 = "sha256-yBMQ4CWfY5hQn29EWlHqSzkMqBnZjPlTm6D973NuRSg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ocean-battery-driver power-monitor pr2-power-board ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Power drivers for the PR2 robot.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
