
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, dynamic-reconfigure, geometry-msgs, mav-msgs, nav-msgs, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-rotors-control";
  version = "2.2.3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rotors_simulator-release";
    rev = "4242b12e01c40dfcbef40417cd4a3351256cfed7";
    owner = "ethz-asl";
    sha256 = "sha256-8O8Ndnv440Ck7CnRukyJPKgzfgb3GOYLHrJ1hYhbGkc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cmake-modules dynamic-reconfigure geometry-msgs mav-msgs nav-msgs roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''RotorS control package'';
    license = with lib.licenses; [ "ASL-2.0" ];
  };
}
