
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pythonPackages }:
buildRosPackage {
  pname = "ros-melodic-fuse-doc";
  version = "0.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fuse-release";
    rev = "2c5628b2cfe2cd653201338bc5cd8f7c97734d54";
    owner = "locusrobotics";
    sha256 = "sha256-26c5pwUd0+LEqoA5ZszgfKebfM7piQ4PZ2VHmP9lhG8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pythonPackages.catkin-pkg ];
  nativeBuildInputs = [ catkin pythonPackages.catkin-pkg ];

  meta = {
    description = ''The fuse_doc package provides documentation and examples for the fuse package.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
