
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, libusb1 }:
buildRosPackage {
  pname = "ros-noetic-lusb";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "lusb-release";
    rev = "4afd608b7e74fc27ab65c52f3c337721efc8da80";
    owner = "DataspeedInc-release";
    sha256 = "sha256-zAbwlREDTG5YSycBEr/RFaxKOCiynL4dg1xJjDv9mJE=";
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
