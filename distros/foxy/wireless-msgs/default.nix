
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, builtin-interfaces, rosidl-default-generators, rosidl-default-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-wireless-msgs";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "wireless-release";
    rev = "41433a2e439c12d32f90fce59163af56d10849ad";
    owner = "clearpath-gbp";
    sha256 = "sha256-VSMc5rxSt+r2dQ6J7XqKe/TzREqe9lq8KR9/r1crwCA=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Messages for describing a wireless network such as bitrate, essid, and link quality.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
