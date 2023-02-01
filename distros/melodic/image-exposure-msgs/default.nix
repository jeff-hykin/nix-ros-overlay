
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, statistics-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-image-exposure-msgs";
  version = "0.14.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pointgrey_camera_driver-release";
    rev = "b9772015c66803add2bfb37fa4edb186a970f67f";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-reyeVa18EedWwKIk7ef6Cq/6YQif+lkcBcueS7m11bM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime statistics-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages related to the Point Grey camera driver.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
