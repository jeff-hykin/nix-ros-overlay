
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-std-capabilities";
  version = "0.1.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "std_capabilities-release";
    rev = "b3ce4780053beaf904c72a588fb9fe1aa90cad0e";
    owner = "ros-gbp";
    sha256 = "sha256-B5MCD1Q5n4GbXIIzgcAgzEbPuCIBdSB+BLsRwGx8v40=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains standard capability interfaces, which describe common robot capabilities in terms of ROS concepts such as topics, services, actions, and parameters.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
