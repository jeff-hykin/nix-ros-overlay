
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, aws-ros1-common, catkin, cloudwatch-metrics-common, gtest, ros-monitoring-msgs, roscpp, rostest, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-cloudwatch-metrics-collector";
  version = "2.2.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cloudwatch_metrics_collector-release";
    rev = "5a93e7037189737f34afa5f1befa8752696fe95b";
    owner = "aws-gbp";
    sha256 = "sha256-6uoWIOMxs3gAXwpdkaD4OQgE3jnisC9Ml/OGQnU/lpI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest rostest ];
  propagatedBuildInputs = [ aws-common aws-ros1-common cloudwatch-metrics-common ros-monitoring-msgs roscpp std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Subscriber node for the aws/monitoring topic to publish metrics to AWS Cloudwatch'';
    license = with lib.licenses; [ asl20 ];
  };
}
