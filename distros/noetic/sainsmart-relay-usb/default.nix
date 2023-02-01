
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, libftdi, roscpp, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-sainsmart-relay-usb";
  version = "0.0.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "sainsmart_relay_usb-release";
    rev = "62bfe99d3fab8154f581c00a7181dab3209701f7";
    owner = "DataspeedInc-release";
    sha256 = "sha256-Fzb/XLmZfDK4mzsj7j2KjD62n6l4kVABp14CzMML4Xo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ libftdi roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''SainSmart USB relay driver controller'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
