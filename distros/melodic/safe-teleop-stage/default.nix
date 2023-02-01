
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joy, safe-teleop-base, stage }:
buildRosPackage {
  pname = "ros-melodic-safe-teleop-stage";
  version = "0.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "shared_autonomy_manipulation-release";
    rev = "d00cb490b730d656bb04d1f0174d3346178d1926";
    owner = "ros-gbp";
    sha256 = "sha256-01/SZ+qAjoSYWM4cBHK+LtYwNiIgpj/m/gt/f2/QtK4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ joy safe-teleop-base stage ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Demo of safe_teleop in stage'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
