
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, eigen, geometry-msgs, rclcpp, rmf-building-map-msgs, rmf-dispenser-msgs, rmf-fleet-msgs, rmf-ingestor-msgs, std-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-galactic-rmf-robot-sim-common";
  version = "1.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_simulation-release";
    rev = "eb24ea12d42c69bd242e017160e318f344fb1efc";
    owner = "ros2-gbp";
    sha256 = "sha256-BaXLYD0arYtoPNtffc5NcHlcRFAAWP1n72h9sDTS+Ts=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen geometry-msgs rclcpp rmf-building-map-msgs rmf-dispenser-msgs rmf-fleet-msgs rmf-ingestor-msgs std-msgs tf2-ros ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Common utility functions for Gazebo and ignition RMF plugins'';
    license = with lib.licenses; [ asl20 ];
  };
}
