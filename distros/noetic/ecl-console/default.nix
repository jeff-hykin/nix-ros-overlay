
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-build, ecl-config, ecl-license }:
buildRosPackage {
  pname = "ros-noetic-ecl-console";
  version = "0.61.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_lite-release";
    rev = "3ad13ffd006c48bde618667f04cd294590eab217";
    owner = "yujinrobot-release";
    sha256 = "sha256-U80/WQjhe/jwjU3uIXnLoAiv6iYHRB6ZmIYmT25Lw6o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-license ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Color codes for ansii consoles.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
