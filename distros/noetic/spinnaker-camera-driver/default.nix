
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-info-manager, catkin, curl, diagnostic-updater, dpkg, dynamic-reconfigure, image-exposure-msgs, image-proc, image-transport, libusb1, nodelet, roscpp, roslaunch, roslint, sensor-msgs, wfov-camera-msgs }:
buildRosPackage {
  pname = "ros-noetic-spinnaker-camera-driver";
  version = "0.2.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "flir_camera_driver-release";
    rev = "97170957682763dbe2098d33d3ed049fb23a8140";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-YLcyvZYBC0Wk/vDT8YMIEkCwHbYSD5HAnYq6Ie4VMyo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin curl dpkg ];
  checkInputs = [ roslaunch roslint ];
  propagatedBuildInputs = [ camera-info-manager diagnostic-updater dynamic-reconfigure image-exposure-msgs image-proc image-transport libusb1 nodelet roscpp sensor-msgs wfov-camera-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Spinnaker camera driver based on Spinnaker.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
