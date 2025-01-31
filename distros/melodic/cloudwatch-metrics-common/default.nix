
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, catkin, cmake, dataflow-lite, file-management, gtest }:
buildRosPackage {
  pname = "ros-melodic-cloudwatch-metrics-common";
  version = "1.1.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cloudwatch_common-release";
    rev = "d7f1e624d0d887cc39dae550d2baed12b1a98ffc";
    owner = "aws-gbp";
    sha256 = "sha256-TW+kBEFv0QV/SVyNlyOtPCcCaYvGeONoIRbgA58xXfI=";
  };

  buildType = "cmake";
  buildInputs = [ catkin cmake ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ aws-common dataflow-lite file-management ];
  nativeBuildInputs = [ catkin cmake ];

  meta = {
    description = ''Library used by ROS1/2 node to publish metrics'';
    license = with lib.licenses; [ asl20 ];
  };
}
