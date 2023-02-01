
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-arbotix-firmware";
  version = "0.11.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "arbotix_ros-release";
    rev = "2b1fffd61710cf6fe0eaf44e3b8723cbe1c82e91";
    owner = "vanadiumlabs";
    sha256 = "sha256-BkxzExAmLRcYekdIOoqt17MqM5wJMZAwzbm/ogv2mbI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Firmware source code for ArbotiX ROS bindings.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
