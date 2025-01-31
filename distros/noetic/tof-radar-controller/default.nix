
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-interface, pluginlib, realtime-tools, rm-common, roscpp }:
buildRosPackage {
  pname = "ros-noetic-tof-radar-controller";
  version = "0.1.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rm_controllers-release";
    rev = "6c2f8104663eb5b91928a66fb41ee38c69fe405d";
    owner = "rm-controls";
    sha256 = "sha256-Kzu/eddWPQX1CDQDSWUfnIgzhQj2G9FGV4Sb0h8/0g8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ controller-interface pluginlib realtime-tools rm-common roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The tof radar controller package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
