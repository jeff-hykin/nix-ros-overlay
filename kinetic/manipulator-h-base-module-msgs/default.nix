
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs, geometry-msgs }:
buildRosPackage {
  pname = "ros-kinetic-manipulator-h-base-module-msgs";
  version = "0.3.1";

  src = fetchurl {
    url = https://github.com/ROBOTIS-GIT-release/ROBOTIS-MANIPULATOR-H-release/archive/release/kinetic/manipulator_h_base_module_msgs/0.3.1-0.tar.gz;
    sha256 = "00ef848728018b26157794c97496c3e3793faa59abf3b16526f1ea8bee59a533";
  };

  propagatedBuildInputs = [ std-msgs message-runtime geometry-msgs ];
  nativeBuildInputs = [ std-msgs catkin message-generation geometry-msgs ];

  meta = {
    description = ''The manipulator_h_base_module_msgs package
    This package includes ROS messages and services for manipulator_h_base_module_msgs'';
    #license = lib.licenses.Apache 2.0;
  };
}