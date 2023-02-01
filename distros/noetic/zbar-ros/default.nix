
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, nodelet, roscpp, roslint, zbar }:
buildRosPackage {
  pname = "ros-noetic-zbar-ros";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "zbar_ros-release";
    rev = "56c92fe678842c8c7e8cc107ca3e903e474612f8";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-J0VRvJf2Gp1KWe/TUJ3mZzLw/N8chmXsA3anbPO6hlQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint ];
  propagatedBuildInputs = [ cv-bridge nodelet roscpp zbar ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Lightweight ROS wrapper for Zbar barcode/qrcode reader library (http://zbar.sourceforge
    .net/)'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
