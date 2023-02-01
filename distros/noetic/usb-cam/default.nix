
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, camera-info-manager, catkin, ffmpeg, image-transport, roscpp, sensor-msgs, std-msgs, std-srvs, v4l-utils }:
buildRosPackage {
  pname = "ros-noetic-usb-cam";
  version = "0.3.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "usb_cam-release";
    rev = "1549512773b24de7073188f058aeb31ae4593a29";
    owner = "ros-gbp";
    sha256 = "sha256-f9BE3cZ4E5uz9WjHVPTiw8Cnt/80lDBjgYU1e/hdI6U=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ camera-info-manager ffmpeg image-transport roscpp sensor-msgs std-msgs std-srvs v4l-utils ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A ROS Driver for V4L USB Cameras'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
