
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-config, ecl-errors, ecl-license }:
buildRosPackage {
  pname = "ros-noetic-ecl-io";
  version = "0.61.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_lite-release";
    rev = "9c59e5fe36818e2353ef330cde7f23593ca8c765";
    owner = "yujinrobot-release";
    sha256 = "sha256-BzfnkqKow3+4/LaN7sRKgwfZMKGLjTot/RWiYPhc7wA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-config ecl-errors ecl-license ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Most implementations (windows, posix, ...) have slightly different api for 
     low level input-output functions. These are gathered here and re-represented 
     with a cross platform set of functions.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
