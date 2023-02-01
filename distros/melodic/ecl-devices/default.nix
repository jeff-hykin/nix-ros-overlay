
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-config, ecl-containers, ecl-errors, ecl-license, ecl-mpl, ecl-threads, ecl-type-traits, ecl-utilities }:
buildRosPackage {
  pname = "ros-melodic-ecl-devices";
  version = "0.62.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_core-release";
    rev = "0e90d0fb5bad13204ed89e317f6645985815ee26";
    owner = "yujinrobot-release";
    sha256 = "sha256-oGJUeamrwedbWfNTEqY0Ruw1LWkc2o1y4xg6bkICWaA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-config ecl-containers ecl-errors ecl-license ecl-mpl ecl-threads ecl-type-traits ecl-utilities ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides an extensible and standardised framework for input-output devices.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
