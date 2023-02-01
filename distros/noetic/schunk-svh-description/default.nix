
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-schunk-svh-description";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "schunk_svh_ros_driver-release";
    rev = "2ee09ecdc0953a9017973c620daf8e83e7582962";
    owner = "fzi-forschungszentrum-informatik";
    sha256 = "sha256-BCPKvBAvjy/uVEQdcmnaW1uhs2xKuwr5UCNg2GDjhBI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The schunk_svh_description package'';
    license = with lib.licenses; [ "GPL-3.0-or-later" ];
  };
}
