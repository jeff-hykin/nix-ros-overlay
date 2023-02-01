
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-updater, roscpp, roscpp-serialization, rtcm-msgs, tf, ublox-msgs, ublox-serialization }:
buildRosPackage {
  pname = "ros-noetic-ublox-gps";
  version = "1.5.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ublox-release";
    rev = "55ded61edcdaeedf0b5fa0b9f61266cd9958033a";
    owner = "KumarRobotics";
    sha256 = "sha256-cOV6LUh53kzyrwCUI63aDm9zqHfMlGgG8Fo4NIqWEHk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ diagnostic-updater roscpp roscpp-serialization rtcm-msgs tf ublox-msgs ublox-serialization ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Driver for u-blox GPS devices.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
