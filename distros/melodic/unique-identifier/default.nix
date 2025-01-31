
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, unique-id, uuid-msgs }:
buildRosPackage {
  pname = "ros-melodic-unique-identifier";
  version = "1.0.6";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "unique_identifier-release";
    rev = "6c31dd7f9e0f45b6d153559361a7db577c2e7e6f";
    owner = "ros-geographic-info";
    sha256 = "sha256-PxqzwB/Ek35RtgN1JvHsoYwcdlCUsfSpayNNJEjqqtk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ unique-id uuid-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS messages and interfaces for universally unique identifiers.

    Not needed for wet packages, use only to resolve dry stack
    dependencies.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
