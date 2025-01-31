
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-config, ecl-errors, ecl-license }:
buildRosPackage {
  pname = "ros-melodic-ecl-io";
  version = "0.61.6";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_lite-release";
    rev = "c56e52ddf0ad11ad8dabb2c6e38381a1e213ae8e";
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
