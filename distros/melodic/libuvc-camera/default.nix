
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-info-manager, catkin, dynamic-reconfigure, image-transport, libuvc, nodelet, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-libuvc-camera";
  version = "0.0.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libuvc_ros-release";
    rev = "60a0472aa6d485e6ca45f9fb9e2aa02a8576c5b6";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-CkgVxB2IqKp4/xDRQV4gJ+LOcba2Xw66STDLO4eITxg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ camera-info-manager dynamic-reconfigure image-transport libuvc nodelet roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''USB Video Class camera driver'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
