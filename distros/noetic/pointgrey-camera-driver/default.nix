
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-info-manager, catkin, curl, diagnostic-updater, dpkg, dynamic-reconfigure, image-exposure-msgs, image-proc, image-transport, libraw1394, libusb1, nodelet, roscpp, roslaunch, roslint, sensor-msgs, stereo-image-proc, wfov-camera-msgs }:
buildRosPackage {
  pname = "ros-noetic-pointgrey-camera-driver";
  version = "0.15.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pointgrey_camera_driver-release";
    rev = "0182f81dadb5e21b133956f30c5ba692b24fa944";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-a8+uQQouJtk36MCF/O7aCT8MjPWaW2c/iVQaUPE+pZA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin curl dpkg ];
  checkInputs = [ roslaunch roslint ];
  propagatedBuildInputs = [ camera-info-manager diagnostic-updater dynamic-reconfigure image-exposure-msgs image-proc image-transport libraw1394 libusb1 nodelet roscpp sensor-msgs stereo-image-proc wfov-camera-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Point Grey camera driver based on libflycapture2.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
