
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, geometry-msgs, roscpp }:
buildRosPackage {
  pname = "ros-melodic-cmd-vel-smoother";
  version = "0.1.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_control-release";
    rev = "bacd691ce07969ed9accccc7779e38912133d64f";
    owner = "tork-a";
    sha256 = "sha256-raT83xBHWrvsxU4lGvHZTWOzLgTTlOzSanrfyPD+VcQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure geometry-msgs roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The cmd_vel_smoother package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
