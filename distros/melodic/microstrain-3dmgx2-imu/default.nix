
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-updater, log4cxx, message-generation, message-runtime, roscpp, self-test, sensor-msgs, std-msgs, std-srvs, tf }:
buildRosPackage {
  pname = "ros-melodic-microstrain-3dmgx2-imu";
  version = "1.5.13-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "microstrain_3dmgx2_imu-release";
    rev = "36503b2f07adef20439d0488d5e7e7139f763a6c";
    owner = "ros-gbp";
    sha256 = "sha256-7MKmlZuU6NLA+ZUDKedUhkyc8Xek4d9LKGqDHO2PNno=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ diagnostic-updater log4cxx message-runtime roscpp self-test sensor-msgs std-msgs std-srvs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A driver for IMUs compatible the microstrain 3DM-GX2 and 3DM-GX3 protocol. Includes 
    a heavily modified standalone driver pulled from the player distribution, 
    and a ROS node.'';
    license = with lib.licenses; [ "LGPL" ];
  };
}
