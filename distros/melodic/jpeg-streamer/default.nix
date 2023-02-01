
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, image-transport, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-jpeg-streamer";
  version = "0.2.7";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "camera_umd-release";
    rev = "e3c75a3104683ca0b0b62d272ace880245c417e8";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-3nfLie2HFYdIPZOtKR7aSKRvm528kp3HaZZcA0U2b+4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ image-transport roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''tools for streaming JPEG-formatted CompressedImage topics over HTTP'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
