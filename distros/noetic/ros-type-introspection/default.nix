
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, roscpp-serialization, rostime }:
buildRosPackage {
  pname = "ros-noetic-ros-type-introspection";
  version = "2.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_type_introspection-release";
    rev = "0eb13ee6e248b9acbdc4b9006970c31f387ca1b7";
    owner = "facontidavide";
    sha256 = "sha256-sZBFF00eC6WRh+jtaRw+Ci9LYlu6IIq9k8FnAcylIa8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp roscpp-serialization rostime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The ros_type_introspection package allows the user to parse and deserialize
  ROS messages which type is unknown at compilation time.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
