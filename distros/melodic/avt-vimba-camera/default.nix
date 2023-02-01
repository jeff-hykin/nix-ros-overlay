
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-info-manager, catkin, diagnostic-updater, dynamic-reconfigure, image-proc, image-transport, message-filters, nodelet, roscpp, sensor-msgs, std-msgs, stereo-image-proc }:
buildRosPackage {
  pname = "ros-melodic-avt-vimba-camera";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "avt_vimba_camera-release";
    rev = "a3f1913ae16349f4646067ad737a92ac6cef1518";
    owner = "astuff";
    sha256 = "sha256-Ykrkl50T1YM/nw8eIdpcqvFcdKnNh828nL+np0TlbEA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ camera-info-manager diagnostic-updater dynamic-reconfigure image-proc image-transport message-filters nodelet roscpp sensor-msgs std-msgs stereo-image-proc ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Camera driver for Allied Vision Technologies (AVT) cameras, based on their Vimba SDK.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
