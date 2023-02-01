
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosserial-client }:
buildRosPackage {
  pname = "ros-noetic-rosserial-chibios";
  version = "0.9.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosserial-release";
    rev = "ab403a484e8bbf3ecf6ebf65c94153814cce1fba";
    owner = "ros-gbp";
    sha256 = "sha256-PrVyJCSdt5hLQEjvi+M1rUT4/qXG3BTi7CnBMWZBhDE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rosserial-client ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rosserial for ChibiOS/HAL platforms.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
