
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, gazebo, gazebo-plugins, gazebo-ros }:
buildRosPackage {
  pname = "ros-humble-aws-robomaker-small-warehouse-world";
  version = "1.0.5-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/aws_robomaker_small_warehouse_world-release/archive/f9c9070e9cd91a1427854905bb1f46810f66d37d.tar.gz";
    sha256 = "sha256-bMYgLcTRb5UvNDZS4HmtCbd1SRpRfQypQmT4SJPbONY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo gazebo-plugins gazebo-ros ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''AWS RoboMaker package for a warehouse world to use in manufacturing and logistics robot applications.'';
    license = with lib.licenses; [ "MIT-0" ];
  };
}
