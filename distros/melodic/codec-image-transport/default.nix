
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ffmpeg, image-transport, pluginlib, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-codec-image-transport";
  version = "0.0.4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "codec_image_transport-release";
    rev = "7e8cf283fb66c83ff0c43b7f69ccf27e83a70880";
    owner = "yoshito-n-students";
    sha256 = "sha256-5+wOPFiWbYxwDeMxHxun513K5P2hddJuiR16C+5L8Bc=";
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
