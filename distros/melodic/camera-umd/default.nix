
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, jpeg-streamer, uvc-camera }:
buildRosPackage {
  pname = "ros-melodic-camera-umd";
  version = "0.2.7";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "camera_umd-release";
    rev = "5af6fbec658c0b6e42fa6369c68735149af9a490";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-U4PFLyVXtuURGMK6J1rOuBHm67pqkFbzVsEW11d9DHM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ jpeg-streamer uvc-camera ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''UMD camera metapackage'';
    license = with lib.licenses; [ "GPL-2.0-only" ];
  };
}
