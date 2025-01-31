
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, cmake, gtest }:
buildRosPackage {
  pname = "ros-melodic-dataflow-lite";
  version = "1.1.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cloudwatch_common-release";
    rev = "92e6852daf53ed9225055099095f15939902873f";
    owner = "aws-gbp";
    sha256 = "sha256-ukmR+DtC08qFCQFdiI8f04FiFNEV67HbX2rKe24sm4M=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ aws-common ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Light version of dataflow libraries'';
    license = with lib.licenses; [ asl20 ];
  };
}
