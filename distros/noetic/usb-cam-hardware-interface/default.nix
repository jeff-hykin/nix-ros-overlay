
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, hardware-interface, roscpp }:
buildRosPackage {
  pname = "ros-noetic-usb-cam-hardware-interface";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "usb_cam_hardware-release";
    rev = "147e697bc29a4b56e59b7a51d4424ec2ef46e757";
    owner = "yoshito-n-students";
    sha256 = "sha256-FwQrsReNysrqa3g5zWxRrkwl706Ehs8c2E7T/OWB+tU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ hardware-interface roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The usb_cam_hardware_interface package'';
    license = with lib.licenses; [ mit ];
  };
}
