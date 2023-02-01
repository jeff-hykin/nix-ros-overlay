
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, calibration-launch, catkin }:
buildRosPackage {
  pname = "ros-melodic-calibration-setup-helper";
  version = "0.10.14";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "calibration-release";
    rev = "01064cbec2c23d09fa5c56932ecfe836303a9ead";
    owner = "ros-gbp";
    sha256 = "sha256-ujYVVLKHFJhoI2njRdKEsaEGMk6hB2dvmt466IZlV4s=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ calibration-launch ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains a script to generate calibration launch and configurationfiles for your robot.
    which is based on Michael Ferguson's calibration code'';
    license = with lib.licenses; [ asl20 ];
  };
}
