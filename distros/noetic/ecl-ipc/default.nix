
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-build, ecl-config, ecl-errors, ecl-exceptions, ecl-license, ecl-time, ecl-time-lite }:
buildRosPackage {
  pname = "ros-noetic-ecl-ipc";
  version = "0.62.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_core-release";
    rev = "bd338e91731daf203e6900bcaff9d54eeff4ac2e";
    owner = "yujinrobot-release";
    sha256 = "sha256-Hvl/b0qZR8VGDnV6sExmpbh7tbAWKSQFrrbKC7UjV20=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-errors ecl-exceptions ecl-license ecl-time ecl-time-lite ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Interprocess mechanisms vary greatly across platforms - sysv, posix, win32, there
  are more than a few. This package provides an infrastructure to allow for developing 
  cross platform c++ wrappers around the lower level c api's that handle these 
  mechanisms. These make it not only easier to utilise such mechanisms, but allow it 
  to be done consistently across platforms.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
