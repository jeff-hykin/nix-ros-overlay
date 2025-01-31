
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, libjpeg, libusb1, pkg-config }:
buildRosPackage {
  pname = "ros-melodic-libuvc";
  version = "0.0.6";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libuvc-release";
    rev = "b6b0dfc549e9d5ffff841f888f5669e49b9bb913";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-iqz5CDravbnxCPIZbnRPq+BQAfriKYYm5nmppVg/bc8=";
  };

  buildType = "cmake";
  buildInputs = [ cmake pkg-config ];
  propagatedBuildInputs = [ catkin libjpeg libusb1 ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''USB Video Class driver library'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
