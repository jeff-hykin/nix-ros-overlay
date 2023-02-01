
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aws-common, aws-ros1-common, catkin, gtest, message-generation, message-runtime, ros-monitoring-msgs, roscpp, rospy, rostest, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-health-metric-collector";
  version = "2.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "health_metric_collector-release";
    rev = "35a315f1a076ecbdb47ccc7a97fb777bbc5a3468";
    owner = "aws-gbp";
    sha256 = "sha256-KDzA3rJq7tkzu4iVbr3mwJuUfo0pNeh/5CP+hJh/XpA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ gtest rostest ];
  propagatedBuildInputs = [ aws-common aws-ros1-common message-generation message-runtime ros-monitoring-msgs roscpp rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The health_metric_collector package'';
    license = with lib.licenses; [ asl20 ];
  };
}
