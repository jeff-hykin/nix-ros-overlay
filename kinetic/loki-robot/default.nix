
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, loki-nav, catkin, loki-demos, loki-teleop, loki-description, loki-bringup }:
buildRosPackage {
  pname = "ros-kinetic-loki-robot";
  version = "0.0.2";

  src = fetchurl {
    url = https://github.com/UbiquityRobotics-release/loki_robot-release/archive/release/kinetic/loki_robot/0.0.2-0.tar.gz;
    sha256 = "8677ac301049313b9abc88e2e4cc7f17a5f9929264e93f5bccdb81252b0b4953";
  };

  propagatedBuildInputs = [ loki-demos loki-nav loki-teleop loki-description loki-bringup ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage for loki configuration'';
    #license = lib.licenses.BSD;
  };
}