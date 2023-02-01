
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, libuvc-camera }:
buildRosPackage {
  pname = "ros-melodic-libuvc-ros";
  version = "0.0.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "libuvc_ros-release";
    rev = "578da9b1d1712839a96982faadfa57c7b13d43a2";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-UknGzSVluNiH9n9nYYQVofJabpIhGJLU4i7VCgqZ6QU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ libuvc-camera ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''libuvc_ros metapackage'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
