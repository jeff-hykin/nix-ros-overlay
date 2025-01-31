
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-power-msgs";
  version = "0.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "power_msgs-release";
    rev = "28ab3b5d23757eb17dd9591f2c4f12763768935f";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-PnrRd4P1smgrACPBwW+yrHfWf7JDA9lPUPWItgh/Ku8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS messages for power measurement and breaker control.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
