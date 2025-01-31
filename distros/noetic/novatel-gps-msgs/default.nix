
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-novatel-gps-msgs";
  version = "3.9.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "novatel_gps_driver-release";
    rev = "3ef2f4b4db28ef602c7a1ff9f154ef2962fe174d";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-6ffgh4V6qqiJA8vtqw7QQiiP94CvFrRD2kEk4Pe43KQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages for proprietary (non-NMEA) sentences from Novatel GPS receivers.'';
    license = with lib.licenses; [ "Southwest-Research-Institute-Proprietary" ];
  };
}
