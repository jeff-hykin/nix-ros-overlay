
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, uuid-msgs, message-generation, message-runtime, std-msgs, rocon-std-msgs }:
buildRosPackage {
  pname = "ros-kinetic-scheduler-msgs";
  version = "0.9.0-r1";

  src = fetchurl {
    url = https://github.com/yujinrobot-release/rocon_msgs-release/archive/release/kinetic/scheduler_msgs/0.9.0-1.tar.gz;
    sha256 = "b60dd96065e4ed9942d5cfdbdd964eb0888dbc451720148e3854b2a6c44f77ab";
  };

  propagatedBuildInputs = [ std-msgs uuid-msgs message-runtime rocon-std-msgs ];
  nativeBuildInputs = [ uuid-msgs message-generation std-msgs catkin rocon-std-msgs ];

  meta = {
    description = ''Messages used by the rocon scheduler.'';
    #license = lib.licenses.BSD;
  };
}