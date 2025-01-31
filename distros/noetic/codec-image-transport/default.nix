
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ffmpeg, image-transport, pluginlib, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-codec-image-transport";
  version = "0.0.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "codec_image_transport-release";
    rev = "c7e7eac5e5dff8dab00251197f30fdb75af7f4d2";
    owner = "yoshito-n-students";
    sha256 = "sha256-D/MNtMRUoxFZ65mnLHNCTWBtVxBlAiR8fLg79fSI0WM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ffmpeg image-transport pluginlib roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The codec_image_transport package'';
    license = with lib.licenses; [ mit ];
  };
}
