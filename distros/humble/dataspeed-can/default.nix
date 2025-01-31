
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, dataspeed-can-msg-filters, dataspeed-can-usb }:
buildRosPackage {
  pname = "ros-humble-dataspeed-can";
  version = "2.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dataspeed_can-release";
    rev = "b51d0489752c85005504eefb713a88013d51ee06";
    owner = "DataspeedInc-release";
    sha256 = "sha256-POBzwny/VrYoGfDkoXI7QH6BcAWKmKJgbN5omfz6JJI=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dataspeed-can-msg-filters dataspeed-can-usb ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''CAN bus tools using Dataspeed hardware'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
