
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-config, ecl-containers, ecl-errors, ecl-license, ecl-mpl, ecl-threads, ecl-type-traits, ecl-utilities }:
buildRosPackage {
  pname = "ros-noetic-ecl-devices";
  version = "0.62.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_core-release";
    rev = "70955350a2a36452c3e649cb5e7f393e9d612d88";
    owner = "yujinrobot-release";
    sha256 = "sha256-NH85W4xb0AnWCI24EUB3RqkIfA7P+9mZi4869Y5FtX0=";
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
