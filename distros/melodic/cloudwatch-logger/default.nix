
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, aws-ros1-common, catkin, cloudwatch-logs-common, gtest, roscpp, rostest, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-cloudwatch-logger";
  version = "2.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cloudwatch_logger-release";
    rev = "3cd9e601dfd1413f8d66feaa17fdd69f6e668fa0";
    owner = "aws-gbp";
    sha256 = "sha256-G2vK4ALqJTArJ7NClwecLNAMLuxv0WhOn94mOJeuCZ8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest rostest ];
  propagatedBuildInputs = [ aws-common aws-ros1-common cloudwatch-logs-common roscpp std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''CloudWatch Logger node for publishing logs to AWS CloudWatch Logs'';
    license = with lib.licenses; [ asl20 ];
  };
}
