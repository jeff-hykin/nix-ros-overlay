
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-ros, ecl-build, ecl-config, ecl-errors, ecl-license }:
buildRosPackage {
  pname = "ros-rolling-ecl-time-lite";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_lite-release";
    rev = "2d88e0dc66bfff6a06ccf9afbeb890edf261e3ce";
    owner = "yujinrobot-release";
    sha256 = "sha256-xUWy6QEatAillIK/EUqV549irG+mWxeknSHHCLIkMT0=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-errors ecl-license ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''Provides a portable set of time functions that are especially useful for
     porting other code or being wrapped by higher level c++ classes.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
