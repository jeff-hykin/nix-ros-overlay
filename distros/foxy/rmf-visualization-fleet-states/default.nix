
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-index-python, rclpy, rmf-building-map-msgs, rmf-fleet-msgs, rmf-traffic-msgs, rmf-visualization-msgs, std-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-foxy-rmf-visualization-fleet-states";
  version = "1.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_visualization-release";
    rev = "09d1bf443ef92ba686319c78cbe5275f952c24c4";
    owner = "ros2-gbp";
    sha256 = "sha256-rMXDIvuXpindhC3hcmSz5F6OXBofjkAey1qC+CPfaVc=";
  };

  buildType = "ament_python";
  buildInputs = [ rmf-fleet-msgs ];
  propagatedBuildInputs = [ ament-index-python rclpy rmf-building-map-msgs rmf-traffic-msgs rmf-visualization-msgs std-msgs visualization-msgs ];

  meta = {
    description = ''Fleet state visualizer'';
    license = with lib.licenses; [ asl20 ];
  };
}
