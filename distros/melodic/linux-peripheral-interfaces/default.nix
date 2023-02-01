
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, laptop-battery-monitor, libsensors-monitor }:
buildRosPackage {
  pname = "ros-melodic-linux-peripheral-interfaces";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "linux_peripheral_interfaces-release";
    rev = "ee8c720cc8ccaa952130aa1540855c96510ad359";
    owner = "ros-gbp";
    sha256 = "sha256-ovMCvViD+/vHsFo5UKb06Ztt63g3B05hzPvUbsdRUXo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ laptop-battery-monitor libsensors-monitor ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Simple scripts which help utilise, monitor, interact with computer
     hardware abstracted by a linux OS.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
