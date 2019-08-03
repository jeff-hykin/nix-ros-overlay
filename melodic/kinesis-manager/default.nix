
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, gtest, catkin, log4cplus, pkg-config, aws-common, curl, openssl, cmake, gmock }:
buildRosPackage {
  pname = "ros-melodic-kinesis-manager";
  version = "2.0.1-r1";

  src = fetchurl {
    url = https://github.com/aws-gbp/kinesis_manager-release/archive/release/melodic/kinesis_manager/2.0.1-1.tar.gz;
    sha256 = "72f3249e68e58cec6b9adcb8d66d73f2effa3386bfef0a41c8734a8041a3d057";
  };

  buildInputs = [ boost log4cplus aws-common curl openssl ];
  checkInputs = [ gtest gmock ];
  propagatedBuildInputs = [ boost log4cplus aws-common curl openssl ];
  nativeBuildInputs = [ cmake catkin pkg-config ];

  meta = {
    description = ''AWS Kinesis stream management library intended for use with the Kinesis Video Producer SDK'';
    license = with lib.licenses; [ asl20 ];
  };
}
