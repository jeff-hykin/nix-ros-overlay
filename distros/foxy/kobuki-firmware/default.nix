
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-ros }:
buildRosPackage {
  pname = "ros-foxy-kobuki-firmware";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "kobuki_firmware-release";
    rev = "5898affb3b2402e5d2a7975a6db39df4f1ddf70d";
    owner = "stonier";
    sha256 = "sha256-bieNP7SYmjrth3ney7LQlvhZ6M4DEkOpP5L8VXtpI3U=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''Firmware blobs for kobuki.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
