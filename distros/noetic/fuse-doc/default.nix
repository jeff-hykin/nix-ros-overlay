
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages }:
buildRosPackage {
  pname = "ros-noetic-fuse-doc";
  version = "0.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fuse-release";
    rev = "4358e2bbd31f4a4ca7b5fde6daf6eee4d3c1bce7";
    owner = "locusrobotics";
    sha256 = "sha256-26c5pwUd0+LEqoA5ZszgfKebfM7piQ4PZ2VHmP9lhG8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin python3Packages.catkin-pkg ];
  nativeBuildInputs = [ catkin python3Packages.catkin-pkg ];

  meta = {
    description = ''The fuse_doc package provides documentation and examples for the fuse package.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
