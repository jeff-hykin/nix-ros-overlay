
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pr2-controllers-msgs, pr2-msgs, roseus }:
buildRosPackage {
  pname = "ros-noetic-jsk-calibration";
  version = "0.1.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_control-release";
    rev = "8d71169cbb5d8c8824b3fcb4314f148b470727e3";
    owner = "tork-a";
    sha256 = "sha256-C0ViUnTsZ1bs8/mhCdlS34UmBr88sgfEPIHtxDmwOEY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pr2-controllers-msgs pr2-msgs roseus ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The jsk_calibration package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
