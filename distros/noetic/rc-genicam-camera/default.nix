
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-updater, dynamic-reconfigure, image-transport, message-generation, message-runtime, nodelet, rc-genicam-api, roscpp, sensor-msgs, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-noetic-rc-genicam-camera";
  version = "1.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rc_genicam_camera-release";
    rev = "7d02efc697c2dfdb0ca010668e55769084081a17";
    owner = "roboception-gbp";
    sha256 = "sha256-SvadPZn8p/Ps2Akqw6I1dVQ4eBQu4+3gm/07jpDGriw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ diagnostic-updater dynamic-reconfigure image-transport message-runtime nodelet rc-genicam-api roscpp sensor-msgs std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rc_genicam_camera provides images from a GenICam compatible camera.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
