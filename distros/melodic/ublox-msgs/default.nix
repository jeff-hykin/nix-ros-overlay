
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, sensor-msgs, std-msgs, ublox-serialization }:
buildRosPackage {
  pname = "ros-melodic-ublox-msgs";
  version = "1.5.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ublox-release";
    rev = "96ad3a5c91f9a20d4b5b026f26bb15e89b24597e";
    owner = "KumarRobotics";
    sha256 = "sha256-Pti1Oh0+JtLsCL2TvUdFUTE1KrqThw6cBTkUqTpP6V8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime sensor-msgs std-msgs ublox-serialization ];
  nativeBuildInputs = [ catkin message-generation ];

  meta = {
    description = ''ublox_msgs contains raw messages for u-blox GNSS devices.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
