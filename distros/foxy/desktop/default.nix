
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, action-tutorials-cpp, action-tutorials-interfaces, action-tutorials-py, ament-cmake, angles, composition, demo-nodes-cpp, demo-nodes-cpp-native, demo-nodes-py, depthimage-to-laserscan, dummy-map-server, dummy-robot-bringup, dummy-sensors, examples-rclcpp-minimal-action-client, examples-rclcpp-minimal-action-server, examples-rclcpp-minimal-client, examples-rclcpp-minimal-composition, examples-rclcpp-minimal-publisher, examples-rclcpp-minimal-service, examples-rclcpp-minimal-subscriber, examples-rclcpp-minimal-timer, examples-rclcpp-multithreaded-executor, examples-rclpy-executors, examples-rclpy-minimal-action-client, examples-rclpy-minimal-action-server, examples-rclpy-minimal-client, examples-rclpy-minimal-publisher, examples-rclpy-minimal-service, examples-rclpy-minimal-subscriber, image-tools, intra-process-demo, joy, lifecycle, logging-demo, pcl-conversions, pendulum-control, pendulum-msgs, quality-of-service-demo-cpp, quality-of-service-demo-py, ros-base, rqt-common-plugins, rviz-default-plugins, rviz2, teleop-twist-joy, teleop-twist-keyboard, tlsf, tlsf-cpp, topic-monitor, turtlesim }:
buildRosPackage {
  pname = "ros-foxy-desktop";
  version = "0.9.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "variants-release";
    rev = "e88e661f0ff4393f57365228046a65d1cc6d7f99";
    owner = "ros2-gbp";
    sha256 = "sha256-tyUBJ2HcdrjmTScLvlFjsOD1Vw8Il3I/1s4lAXRJ89Q=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-tutorials-cpp action-tutorials-interfaces action-tutorials-py angles composition demo-nodes-cpp demo-nodes-cpp-native demo-nodes-py depthimage-to-laserscan dummy-map-server dummy-robot-bringup dummy-sensors examples-rclcpp-minimal-action-client examples-rclcpp-minimal-action-server examples-rclcpp-minimal-client examples-rclcpp-minimal-composition examples-rclcpp-minimal-publisher examples-rclcpp-minimal-service examples-rclcpp-minimal-subscriber examples-rclcpp-minimal-timer examples-rclcpp-multithreaded-executor examples-rclpy-executors examples-rclpy-minimal-action-client examples-rclpy-minimal-action-server examples-rclpy-minimal-client examples-rclpy-minimal-publisher examples-rclpy-minimal-service examples-rclpy-minimal-subscriber image-tools intra-process-demo joy lifecycle logging-demo pcl-conversions pendulum-control pendulum-msgs quality-of-service-demo-cpp quality-of-service-demo-py ros-base rqt-common-plugins rviz-default-plugins rviz2 teleop-twist-joy teleop-twist-keyboard tlsf tlsf-cpp topic-monitor turtlesim ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A package which extends 'ros_base' and includes high level packages like vizualization tools and demos.'';
    license = with lib.licenses; [ asl20 ];
  };
}
