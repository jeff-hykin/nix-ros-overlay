
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, range-sensor-layer, social-navigation-layers }:
buildRosPackage {
  pname = "ros-melodic-navigation-layers";
  version = "0.5.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_layers_release";
    rev = "e3a933f8dac4e192362daa795250574393a0f04e";
    owner = "wu-robotics";
    sha256 = "sha256-l/gS4O7DnzHKS3Twql4G5KzI9z6SyH2xp3M42r+unV0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ range-sensor-layer social-navigation-layers ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Extra navigation layers.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
