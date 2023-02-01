
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake, gbenchmark }:
buildRosPackage {
  pname = "ros-galactic-google-benchmark-vendor";
  version = "0.0.6-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "google_benchmark_vendor-release";
    rev = "0c87df40b89f2566bb91891bbf26f74f79e1f21b";
    owner = "ros2-gbp";
    sha256 = "sha256-kZWrDt+rkrmLS1POdh5Ye0xYuzDkCGOOdyFJb6Nn/U4=";
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
