
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, clober-msgs, geometry-msgs, nav-msgs, rclcpp, sensor-msgs, std-msgs, tf2, tf2-geometry-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-foxy-clober-serial";
  version = "0.2.0-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "clober_ros2-release";
    rev = "062477b73362fc789b15cf232cadd4fb206125ef";
    owner = "CLOBOT-Co-Ltd-release";
    sha256 = "sha256-aZQg/x3tNzrgTa62nQPdW2nTX8ZkNj360/EZ6hg6ykQ=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ clober-msgs geometry-msgs nav-msgs rclcpp sensor-msgs std-msgs tf2 tf2-geometry-msgs tf2-ros ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''clober serial package'';
    license = with lib.licenses; [ asl20 ];
  };
}
