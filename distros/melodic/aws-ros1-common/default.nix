
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, catkin, gtest, roscpp, rostest }:
buildRosPackage {
  pname = "ros-melodic-aws-ros1-common";
  version = "2.0.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "aws_ros1_common-release";
    rev = "2363dee7620de396bc7c106fca2ddfde76252ac3";
    owner = "aws-gbp";
    sha256 = "sha256-gfX+MXg0KqRJBaeqGzMO8vpz1h0uSfU4r/bvaiwmCkM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest rostest ];
  propagatedBuildInputs = [ aws-common roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Common utilities for ROS1 nodes using Amazon Web Services'';
    license = with lib.licenses; [ asl20 ];
  };
}
