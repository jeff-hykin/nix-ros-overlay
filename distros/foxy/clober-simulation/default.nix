
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, clober-description, gazebo-ros-pkgs, geometry-msgs, nav-msgs, rclcpp, sensor-msgs, tf2 }:
buildRosPackage {
  pname = "ros-foxy-clober-simulation";
  version = "0.2.0-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "clober_ros2-release";
    rev = "ce5861e10559b5edbefce65d975ba672a6308806";
    owner = "CLOBOT-Co-Ltd-release";
    sha256 = "sha256-+734VfFPesnsCMelr1j7HTU0bAsqpnYhc1KNDTjiFEg=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ clober-description gazebo-ros-pkgs geometry-msgs nav-msgs rclcpp sensor-msgs tf2 ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''clober gazebo simulation package'';
    license = with lib.licenses; [ asl20 ];
  };
}
