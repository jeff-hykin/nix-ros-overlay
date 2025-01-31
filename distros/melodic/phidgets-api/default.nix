
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, libphidget21 }:
buildRosPackage {
  pname = "ros-melodic-phidgets-api";
  version = "0.7.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "phidgets_drivers-release";
    rev = "d25e4e9198472ebdb65498058873178e5b798652";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-xOaIcUTjuL+f/wPhj+IY6szBK4vXT7+J7fJ13e+1VJY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ libphidget21 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A C++ Wrapper for the Phidgets C API'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
