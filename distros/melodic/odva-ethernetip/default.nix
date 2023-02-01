
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, console-bridge, rosunit }:
buildRosPackage {
  pname = "ros-melodic-odva-ethernetip";
  version = "0.1.4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "odva_ethernetip-release";
    rev = "78d8eccd42436befbd9aeb83b6062e07a49e162b";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-RAdaguGfKzdmcBt5chbirgqU+lVk1Kb5Ji6lQM8Vhig=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ boost console-bridge ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Library implementing ODVA EtherNet/IP (Industrial Protocol).'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
