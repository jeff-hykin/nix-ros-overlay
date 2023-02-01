
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-network-detector";
  version = "1.0.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "linux_networking-release";
    rev = "f7e1260cea1cc9acc763898d0efd5d6416863591";
    owner = "pr2-gbp";
    sha256 = "sha256-8ZvGDjJ+uFX9N4AfOxe0b4ljFWJh4+ZbyZtl7sI3byg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A ROS node that watches a given network interface and publishes
     whether it is both UP and RUNNING (indicating that a cable is
     plugged into it and communication is happening, for instance) or
     not.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
