
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-laser-scan-publisher-tutorial";
  version = "0.2.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_tutorials-release";
    rev = "5fce6d384054eaa5b391ba6dca86c2c47cf9ac83";
    owner = "ros-gbp";
    sha256 = "sha256-EqNTi1WNsONVL8yf9S2uCHq2uwclDtcHD3TlTmEsWF4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The laser_scan_publisher_tutorial package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
