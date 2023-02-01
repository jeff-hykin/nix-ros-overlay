
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, libusb1 }:
buildRosPackage {
  pname = "ros-melodic-lusb";
  version = "1.1.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "lusb-release";
    rev = "2ee06ea855b9c51f3507d41a9e2856bd01748f9b";
    owner = "DataspeedInc-release";
    sha256 = "sha256-Sf21ok/Ni8XBxm5rUB5BMgEmA691DJsaWU9Al9Qklyc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost libusb1 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Library for interfacing to USB devices'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
