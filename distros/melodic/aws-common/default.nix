
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, curl, gtest, openssl, ros-environment, util-linux, zlib }:
buildRosPackage {
  pname = "ros-melodic-aws-common";
  version = "2.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "aws_common-release";
    rev = "1628f1066414d49c91c0a652ecf698f0ab9f0038";
    owner = "aws-gbp";
    sha256 = "sha256-1RDpsiryF7yJ4e24yRk9U7xr3RHn9LYYqjKjLWtxT08=";
  };

  buildType = "cmake";
  buildInputs = [ catkin cmake ros-environment ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ curl openssl util-linux zlib ];
  nativeBuildInputs = [ catkin cmake ];

  meta = {
    description = ''Common AWS SDK utilities, intended for use by ROS packages using the AWS SDK'';
    license = with lib.licenses; [ asl20 ];
  };
}
