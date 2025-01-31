
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-ros, ecl-build, ecl-command-line, ecl-config, ecl-console, ecl-converters, ecl-devices, ecl-geometry, ecl-mobile-robot, ecl-sigslots, ecl-threads, ecl-time }:
buildRosPackage {
  pname = "ros-galactic-kobuki-core";
  version = "1.4.0-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/kobuki_core-release/archive/release/galactic/kobuki_core/1.4.0-1.tar.gz";
    name = "1.4.0-1.tar.gz";
    sha256 = "549715c65c6f5596a385ab0d393cad4c8f9f14924c04bca98c2833ccd088d29a";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros ecl-build ];
  propagatedBuildInputs = [ ecl-command-line ecl-config ecl-console ecl-converters ecl-devices ecl-geometry ecl-mobile-robot ecl-sigslots ecl-threads ecl-time ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''Pure C++ driver library for Kobuki.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
