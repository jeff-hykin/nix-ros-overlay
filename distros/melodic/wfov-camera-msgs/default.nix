
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-wfov-camera-msgs";
  version = "0.14.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pointgrey_camera_driver-release";
    rev = "499e728adfb53a0edff67652d4ff0a418a2d7854";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-jk5AVd7LOurjCjYndKsst+OLd9nfDvlsw2eITANcHMc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages related to the Point Grey camera driver.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
