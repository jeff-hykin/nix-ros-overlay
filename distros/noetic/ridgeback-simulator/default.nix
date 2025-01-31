
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ridgeback-gazebo }:
buildRosPackage {
  pname = "ros-noetic-ridgeback-simulator";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ridgeback_simulator-release";
    rev = "3ed5cdfe6738d3185eaa118505bdb7b885755606";
    owner = "clearpath-gbp";
    sha256 = "sha256-ANMl+apHXAevhD6t8csD5lR6hPxof8n3hghzQ+pjq+U=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ridgeback-gazebo ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Packages for simulating Ridgeback.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
