
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, libusb1, pkg-config }:
buildRosPackage {
  pname = "ros-foxy-lusb";
  version = "2.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "lusb-release";
    rev = "3deceb6e0a9bc1b830229c791259b4ce88c3ad77";
    owner = "DataspeedInc-release";
    sha256 = "sha256-YBKQ/Or1xZDZ9J/UFs2hk4TFSkAP332CH1FfsuKbcXE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake pkg-config ];
  propagatedBuildInputs = [ libusb1 ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Library for interfacing to USB devices'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
