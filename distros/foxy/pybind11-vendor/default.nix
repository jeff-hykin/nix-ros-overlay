
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, git }:
buildRosPackage {
  pname = "ros-foxy-pybind11-vendor";
  version = "2.2.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pybind11_vendor-release";
    rev = "5cb7343efc3028fe0e3621248e8a77ecb4fc55fa";
    owner = "ros2-gbp";
    sha256 = "sha256-D+O9IJMdlZjOloFKvwu8ptAuCYSfn6yM0z/zVmZe6Tw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake git ];
  nativeBuildInputs = [ ament-cmake git ];

  meta = {
    description = ''Wrapper around pybind11.'';
    license = with lib.licenses; [ asl20 bsdOriginal ];
  };
}
