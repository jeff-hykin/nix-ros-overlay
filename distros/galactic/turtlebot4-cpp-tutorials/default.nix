
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, irobot-create-msgs, rclcpp }:
buildRosPackage {
  pname = "ros-galactic-turtlebot4-cpp-tutorials";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot4_tutorials-release";
    rev = "b3fe693865094c8acc80b99498840991a4e76fdb";
    owner = "ros2-gbp";
    sha256 = "sha256-w0P2tbMIboOxkU7I8ETVOqmBA7md1MQGe+bgV2ck4fw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ irobot-create-msgs rclcpp ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''TurtleBot 4 C++ Tutorials'';
    license = with lib.licenses; [ asl20 ];
  };
}
