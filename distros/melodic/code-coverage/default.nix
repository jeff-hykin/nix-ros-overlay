
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, lcov, pythonPackages }:
buildRosPackage {
  pname = "ros-melodic-code-coverage";
  version = "0.4.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "code_coverage-gbp";
    rev = "329a03559e90c45798b03a7e828aa9cfa25c0fc2";
    owner = "mikeferguson";
    sha256 = "sha256-tuHXMWMwV9LKW6amsHtyAwFUGtRItqzC3r5jCiLJsk4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ lcov pythonPackages.coverage ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''CMake configuration to run coverage'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
