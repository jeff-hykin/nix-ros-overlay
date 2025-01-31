
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-command-line, libftdi, libusb1, pkg-config }:
buildRosPackage {
  pname = "ros-noetic-kobuki-ftdi";
  version = "0.7.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "kobuki_core-release";
    rev = "4adb81bf541a74361a01da1185ecb61f48c7d6f5";
    owner = "yujinrobot-release";
    sha256 = "sha256-i2LlVZgPhygnQ1VayUu65PWLgt4CPqOSiL1X4jqq4IA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pkg-config ];
  propagatedBuildInputs = [ ecl-command-line libftdi libusb1 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Utilities for flashing and enabling Kobuki's USB connection.
	    This package contains tools for flashing the Kobuki's FTDI chip (usually done at the factory).
	    The special firmware for the FTDI chip (USB to serial converter) enables it to appear as
	    /dev/kobuki on the user's PC.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
