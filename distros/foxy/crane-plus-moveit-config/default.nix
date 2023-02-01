
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, moveit, robot-state-publisher, rviz2, tf2-ros, xacro }:
buildRosPackage {
  pname = "ros-foxy-crane-plus-moveit-config";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "crane_plus-release";
    rev = "1b77f21d5726f01ac743c0f9c60e4ad353bc0e57";
    owner = "ros2-gbp";
    sha256 = "sha256-Tbh0zyhLZgj+HMxgzFFqBRmXOrlwMpwilCJ1jyPyiQ0=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ moveit robot-state-publisher rviz2 tf2-ros xacro ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''CRANE+ V2 move_group config package'';
    license = with lib.licenses; [ asl20 ];
  };
}
