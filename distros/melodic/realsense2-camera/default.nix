
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, ddynamic-reconfigure, diagnostic-updater, eigen, genmsg, image-transport, librealsense2, message-generation, message-runtime, nav-msgs, nodelet, roscpp, sensor-msgs, std-msgs, std-srvs, tf }:
buildRosPackage {
  pname = "ros-melodic-realsense2-camera";
  version = "2.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "realsense-ros-release";
    rev = "c951ae0a42408786c50a4a7774d5dee3dbd18e62";
    owner = "IntelRealSense";
    sha256 = "sha256-My96v7R1TsuqQAkUC7ZyVCcfGG1OmhuJGnHJESXvwqY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ cv-bridge ddynamic-reconfigure diagnostic-updater eigen genmsg image-transport librealsense2 message-runtime nav-msgs nodelet roscpp sensor-msgs std-msgs std-srvs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''RealSense Camera package allowing access to Intel T265 Tracking module and SR300 and D400 3D cameras'';
    license = with lib.licenses; [ asl20 ];
  };
}
