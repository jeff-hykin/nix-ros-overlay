
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-visualization-msgs";
  version = "1.13.1-r1";

"/Users/jeffhykin/Downloads/common_msgs-release-d2e7d1c63efa65c8082f3a6d125eac6bf6c0a037.tar.gz"

  src = fetchurl {
    url = "https://github.com/ros-gbp/common_msgs-release/archive/d2e7d1c63efa65c8082f3a6d125eac6bf6c0a037.tar.gz";
    name = "1.13.1-1.tar.gz";
    sha256 = "73f8539af5c5703b9ef50f1d0b898e1568181df2dae1d378d367b53b9ea1a785";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''visualization_msgs is a set of messages used by higher level packages, such as <a href="/wiki/rviz">rviz</a>, that deal in visualization-specific data.

    The main messages in visualization_msgs is <tt>visualization_msgs/Marker</tt>.
    The marker message is used to send visualization &quot;markers&quot; such as boxes, spheres, arrows, lines, etc. to a visualization environment such as <a href="http:///www.ros.org/wiki/rviz">rviz</a>.
    See the rviz tutorial <a href="http://www.ros.org/wiki/rviz/Tutorials">rviz tutorials</a> for more information.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
