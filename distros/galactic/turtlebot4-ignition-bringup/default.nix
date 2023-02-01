
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, geometry-msgs, irobot-create-common-bringup, irobot-create-description, irobot-create-ignition-bringup, irobot-create-ignition-toolbox, irobot-create-msgs, irobot-create-nodes, irobot-create-toolbox, ros-ign-bridge, ros-ign-gazebo, ros-ign-interfaces, std-msgs, turtlebot4-description, turtlebot4-ignition-gui-plugins, turtlebot4-ignition-toolbox, turtlebot4-msgs, turtlebot4-navigation, turtlebot4-node, turtlebot4-viz }:
buildRosPackage {
  pname = "ros-galactic-turtlebot4-ignition-bringup";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot4_simulator-release";
    rev = "b2b22e0948bf7a8d35c9df5502e76264662df88b";
    owner = "ros2-gbp";
    sha256 = "sha256-WG3yenArDlrsNEG1EGIVAKI28T+a/LpiYgFeJ4yoTgI=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ geometry-msgs irobot-create-common-bringup irobot-create-description irobot-create-ignition-bringup irobot-create-ignition-toolbox irobot-create-msgs irobot-create-nodes irobot-create-toolbox ros-ign-bridge ros-ign-gazebo ros-ign-interfaces std-msgs turtlebot4-description turtlebot4-ignition-gui-plugins turtlebot4-ignition-toolbox turtlebot4-msgs turtlebot4-navigation turtlebot4-node turtlebot4-viz ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''TurtleBot 4 Ignition Simulator bringup'';
    license = with lib.licenses; [ asl20 ];
  };
}
