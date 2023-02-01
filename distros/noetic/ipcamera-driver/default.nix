
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-info-manager, catkin, cv-bridge, dynamic-reconfigure, image-transport, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-ipcamera-driver";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ipcamera_driver-release";
    rev = "2edb40fcbcbeaf3f9096d5fba45477a7ba8d5ee3";
    owner = "alireza-hosseini";
    sha256 = "sha256-ivR9wNM/QGVEMrcRR4wv52fRANuXyRpFrdwOBa11HyM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ camera-info-manager cv-bridge dynamic-reconfigure image-transport roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Simple node to publish regular IP camera video streams to a ros topic.'';
    license = with lib.licenses; [ "GPL" ];
  };
}
