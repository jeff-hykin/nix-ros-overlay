
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, rosatomic, catkin, allocators, lockfree, rosrt }:
buildRosPackage {
  pname = "ros-kinetic-ros-realtime";
  version = "1.0.25";

  src = fetchurl {
    url = https://github.com/ros-gbp/ros_realtime-release/archive/release/kinetic/ros_realtime/1.0.25-0.tar.gz;
    sha256 = "d6befaa3239551ccb92713f11985cc11d39d916c28141c51401079bb40297fe5";
  };

  propagatedBuildInputs = [ lockfree rosatomic allocators rosrt ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The ros_realtime package'';
    #license = lib.licenses.TODO;
  };
}