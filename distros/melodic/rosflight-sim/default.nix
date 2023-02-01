
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, gazebo, gazebo-plugins, gazebo-ros, geometry-msgs, roscpp, rosflight-firmware, rosflight-msgs }:
buildRosPackage {
  pname = "ros-melodic-rosflight-sim";
  version = "1.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosflight-release";
    rev = "053ec5800befecf2adc2baee5a8d4e1b73ac9ede";
    owner = "rosflight";
    sha256 = "sha256-NYktbMe48QwQ56879Ukgy11JOHFGeB/es3O2v5gRjs0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eigen gazebo gazebo-plugins gazebo-ros geometry-msgs roscpp rosflight-firmware rosflight-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Software-in-the-loop (SIL) simulator for the ROSflight firmware'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
