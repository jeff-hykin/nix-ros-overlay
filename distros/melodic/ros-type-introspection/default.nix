
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, roscpp-serialization, rostime }:
buildRosPackage {
  pname = "ros-melodic-ros-type-introspection";
  version = "2.1.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_type_introspection-release";
    rev = "94e0a12d2643538368310026ff1de07ac0c93821";
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
