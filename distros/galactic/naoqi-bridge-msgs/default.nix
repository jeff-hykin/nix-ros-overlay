
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, action-msgs, ament-cmake, ament-lint-auto, ament-lint-common, geometry-msgs, nav-msgs, rosidl-default-generators, rosidl-default-runtime, sensor-msgs, std-msgs, trajectory-msgs }:
buildRosPackage {
  pname = "ros-galactic-naoqi-bridge-msgs";
  version = "2.0.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "naoqi_bridge_msgs2-release";
    rev = "212e773aeeaecabf92947143b642c51f4527cab9";
    owner = "ros-naoqi";
    sha256 = "sha256-AaG/G54fiOoMJ5eBb0/+P53U/xgguHfEhyoFfritTN0=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ action-msgs geometry-msgs nav-msgs rosidl-default-runtime sensor-msgs std-msgs trajectory-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''The naoqi_bridge_msgs package provides custom messages for running Aldebaran's robots in ROS2.'';
    license = with lib.licenses; [ asl20 ];
  };
}
