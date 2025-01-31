
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, arbotix-controllers, arbotix-firmware, arbotix-msgs, arbotix-python, arbotix-sensors, catkin }:
buildRosPackage {
  pname = "ros-noetic-arbotix";
  version = "0.11.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "arbotix_ros-release";
    rev = "3e41ac502609a53d2d7f7f29fb849a423109406b";
    owner = "vanadiumlabs";
    sha256 = "sha256-MNVRbOK/6zQS+HHO8EaWKfkvzYTjHLsDMwxKvj1hMtc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ arbotix-controllers arbotix-firmware arbotix-msgs arbotix-python arbotix-sensors ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ArbotiX Drivers'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
