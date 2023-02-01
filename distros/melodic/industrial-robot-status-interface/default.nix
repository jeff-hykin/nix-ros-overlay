
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, hardware-interface }:
buildRosPackage {
  pname = "ros-melodic-industrial-robot-status-interface";
  version = "0.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "industrial_robot_status_controller-release";
    rev = "07eb2d5c35c1257dea1bfe32b7eaa48cdc10475f";
    owner = "gavanderhoorn";
    sha256 = "sha256-J1PiBH1lTC2sKh1Dc3IxXux9JyByOJNeXzxjdVkbU5c=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ hardware-interface ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Exposes ROS-Industrial's RobotStatus info from hardware_interfaces for consumption by ros_control controllers.'';
    license = with lib.licenses; [ asl20 ];
  };
}
