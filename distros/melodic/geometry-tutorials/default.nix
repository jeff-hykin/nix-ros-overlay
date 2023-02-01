
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, turtle-tf, turtle-tf2 }:
buildRosPackage {
  pname = "ros-melodic-geometry-tutorials";
  version = "0.2.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "geometry_tutorials-release";
    rev = "2a0ba103cf0f02082b6518bcc513adef066e75b3";
    owner = "ros-gbp";
    sha256 = "sha256-8TFVqx9XsM4p3sUBQ+KfvPXNtVHeccdETErbdvmt/UQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ turtle-tf turtle-tf2 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage of geometry tutorials ROS.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
