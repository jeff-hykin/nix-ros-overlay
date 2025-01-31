
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake, gbenchmark }:
buildRosPackage {
  pname = "ros-foxy-google-benchmark-vendor";
  version = "0.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "google_benchmark_vendor-release";
    rev = "95320614905b4c535e78690d062b3d935847382c";
    owner = "ros2-gbp";
    sha256 = "sha256-RSqaND91QeTX2POtkVIGwJAy9evjeiVItx/yllJSEqM=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ gbenchmark ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''This package provides Google Benchmark.'';
    license = with lib.licenses; [ asl20 ];
  };
}
