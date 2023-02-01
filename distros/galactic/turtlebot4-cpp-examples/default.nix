
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, camera-info-manager, cv-bridge, depthai-bridge, depthai-ros-msgs, image-transport, opencv, rclcpp, sensor-msgs, std-msgs, stereo-msgs, vision-msgs }:
buildRosPackage {
  pname = "ros-galactic-turtlebot4-cpp-examples";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot4_examples-release";
    rev = "e620cf689c8e809a7216e7c985ca364f76209097";
    owner = "ros2-gbp";
    sha256 = "sha256-3bTId47rL7JrQ3ZqroYIwI7PEYkDfqxfSZtY6xZ/SwU=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ camera-info-manager cv-bridge depthai-bridge depthai-ros-msgs image-transport opencv rclcpp sensor-msgs std-msgs stereo-msgs vision-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''TurtleBot 4 C++ Examples'';
    license = with lib.licenses; [ asl20 ];
  };
}
