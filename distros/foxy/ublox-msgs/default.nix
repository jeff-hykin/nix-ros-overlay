
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-ros, rosidl-default-generators, sensor-msgs, std-msgs, ublox-serialization }:
buildRosPackage {
  pname = "ros-foxy-ublox-msgs";
  version = "2.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ublox-release";
    rev = "fc83f3d03321cf2e5f320922ffc56d041b36035f";
    owner = "ros2-gbp";
    sha256 = "sha256-nkClSwl52aeps1kiJB3AaDZpgPC27B/RytMvqWKPxE4=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros rosidl-default-generators ];
  propagatedBuildInputs = [ sensor-msgs std-msgs ublox-serialization ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''ublox_msgs contains raw messages for u-blox GNSS devices.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
