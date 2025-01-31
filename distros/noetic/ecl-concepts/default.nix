
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-config, ecl-license, ecl-type-traits }:
buildRosPackage {
  pname = "ros-noetic-ecl-concepts";
  version = "0.62.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_core-release";
    rev = "5dc9ff1496d6fc29250398e478e7b2847b439cd4";
    owner = "yujinrobot-release";
    sha256 = "sha256-bgWoUQjHVkyeflSFUt/hIUQItyOBupLqFll1C0n8grg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-config ecl-license ecl-type-traits ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Introduces a compile time concept checking mechanism that can be used
     most commonly to check for required functionality when passing
     template arguments.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
