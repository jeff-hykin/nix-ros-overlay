
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros, hector-gazebo-plugins }:
buildRosPackage {
  pname = "ros-noetic-hector-gazebo-worlds";
  version = "0.5.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_gazebo-release";
    rev = "d7812c748f4ba0617d778d6d3cfd92535dd31fd0";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-DMc4PnfYFalcJ8tf4UDRrf68rGq90JQeC6ASpbRNmdc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros hector-gazebo-plugins ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_gazebo_worlds provides gazebo scenarios used by Team Hector Darmstadt'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
