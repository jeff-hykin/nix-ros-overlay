
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, diff-drive-controller, hardware-interface, joint-state-controller, robot-state-publisher, roscpp, rosparam-shortcuts, sensor-msgs, transmission-interface }:
buildRosPackage {
  pname = "ros-noetic-diffbot-control";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "diffbot-release";
    rev = "b29f01108c56b1d08e57b98597003e67111ece5d";
    owner = "ros-mobile-robots-release";
    sha256 = "sha256-ocP/MlfCsMVyJXl9x9thHsgjSBoCU5ys12Bp7U/FXes=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ controller-manager diff-drive-controller hardware-interface joint-state-controller robot-state-publisher roscpp rosparam-shortcuts sensor-msgs transmission-interface ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The diffbot_control package'';
    license = with lib.licenses; [ "BSDv3" ];
  };
}
