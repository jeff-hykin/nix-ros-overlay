
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-willow-maps";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "willow_maps-release";
    rev = "7a329838e9b77480029ae951215ab47057134c2f";
    owner = "ros-gbp";
    sha256 = "sha256-IIn8UQEUNVNd+OCgqtSbqflAXMrQItZZjwiSGzuJKd4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Holds maps of Willow Garage that can be used for a number of different applications.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
