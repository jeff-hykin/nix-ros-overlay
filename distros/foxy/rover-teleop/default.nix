
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, joy, rclpy }:
buildRosPackage {
  pname = "ros-foxy-rover-teleop";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roverrobotics_ros2-release";
    rev = "427fda154e61811c7430d7db91618facaae5c393";
    owner = "RoverRobotics-release";
    sha256 = "sha256-2K4NoCJz66NoypKd9KDJyZbg+WfuJ+ASrfPQ2Qdm5pw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ joy rclpy ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Contains Rover provided teleoperation applications.'';
    license = with lib.licenses; [ bsd3 ];
  };
}
