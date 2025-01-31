
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-updater, lm_sensors, roscpp }:
buildRosPackage {
  pname = "ros-melodic-libsensors-monitor";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "linux_peripheral_interfaces-release";
    rev = "4f662a6e5e4af9e94f648a5715fef213c5283834";
    owner = "ros-gbp";
    sha256 = "sha256-ldOEcPpUn71vCvh6j1Ws8XKvY5zOTUPUzzzQoE9oDmw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ diagnostic-updater lm_sensors roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A ROS node for using libsensors to provide diagnostics information about the sensors on a computer system.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
