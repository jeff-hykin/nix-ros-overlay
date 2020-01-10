
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, cmake, dataflow-lite, gmock, gtest }:
buildRosPackage {
  pname = "ros-melodic-file-management";
  version = "1.1.2-r1";

  src = fetchurl {
    url = "https://github.com/aws-gbp/cloudwatch_common-release/archive/release/melodic/file_management/1.1.2-1.tar.gz";
    name = "1.1.2-1.tar.gz";
    sha256 = "da43a316c11b0fd8f057e0a4019bdfd21d98de93dffb98fb940896532bb47379";
  };

  buildType = "cmake";
  checkInputs = [ gmock gtest ];
  propagatedBuildInputs = [ aws-common dataflow-lite ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''AWS CloudWatch management library used to manage offline files.'';
    license = with lib.licenses; [ asl20 ];
  };
}
