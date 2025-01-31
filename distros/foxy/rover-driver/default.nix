
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, diagnostic-updater, eigen, nav-msgs, rclcpp, rover-msgs, std-msgs, tf2-geometry-msgs }:
buildRosPackage {
  pname = "ros-foxy-rover-driver";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "roverrobotics_ros2-release";
    rev = "23e185bead7b05de4b216efce721c082613c352b";
    owner = "RoverRobotics-release";
    sha256 = "sha256-ytctUDFgd+AXTy3FciYDGwqj7GOJiwq6sERLhSuGZnI=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-updater eigen nav-msgs rclcpp rover-msgs std-msgs tf2-geometry-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Serial driver for Rover platform.'';
    license = with lib.licenses; [ bsd3 ];
  };
}
