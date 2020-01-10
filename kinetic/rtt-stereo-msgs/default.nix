
# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rtt-geometry-msgs, rtt-roscomm, rtt-sensor-msgs, rtt-std-msgs, stereo-msgs }:
buildRosPackage {
  pname = "ros-kinetic-rtt-stereo-msgs";
  version = "2.9.2-r1";

  src = fetchurl {
    url = "https://github.com/orocos-gbp/rtt_ros_integration-release/archive/release/kinetic/rtt_stereo_msgs/2.9.2-1.tar.gz";
    name = "2.9.2-1.tar.gz";
    sha256 = "15e3fa0e2e90b22adec8dc13cb68cc4403e6bd7b2889b2544e5d348a35228c7e";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ rtt-geometry-msgs rtt-roscomm rtt-sensor-msgs rtt-std-msgs stereo-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides an rtt typekit for ROS stereo_msgs messages.

    It allows you to use ROS messages transparently in
    RTT components and applications.

    This package was automatically generated by the
    create_rtt_msgs generator and should not be manually
    modified.

    See the http://ros.org/wiki/stereo_msgs documentation
    for the documentation of the ROS messages in this
    typekit.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
