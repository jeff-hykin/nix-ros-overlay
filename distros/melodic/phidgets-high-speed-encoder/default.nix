
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nodelet, phidgets-api, phidgets-msgs, pluginlib, roscpp, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-phidgets-high-speed-encoder";
  version = "0.7.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "phidgets_drivers-release";
    rev = "ac2b7f699ee0501e9ab75a501906016b7acbb452";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-hfp3k2csPUcX8p6bIQCndvgGdp2VU7hJGcyIlL3HEAU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ nodelet phidgets-api phidgets-msgs pluginlib roscpp sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Driver for the Phidgets high speed encoder devices'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
