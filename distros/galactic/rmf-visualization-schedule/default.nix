
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, boost, builtin-interfaces, eigen, geometry-msgs, nav-msgs, opencv, openssl, rclcpp, rmf-building-map-msgs, rmf-cmake-uncrustify, rmf-traffic, rmf-traffic-msgs, rmf-traffic-ros2, rmf-visualization-msgs, rosidl-default-generators, visualization-msgs, websocketpp }:
buildRosPackage {
  pname = "ros-galactic-rmf-visualization-schedule";
  version = "1.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_visualization-release";
    rev = "2efc02d07ecf508892605b34867f0d2db9200ca7";
    owner = "ros2-gbp";
    sha256 = "sha256-A9AVM+p613Yun00wftpISftnBP5GbAOu2Zvy5BXhGb8=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common rmf-cmake-uncrustify ];
  propagatedBuildInputs = [ boost builtin-interfaces eigen geometry-msgs nav-msgs opencv openssl rclcpp rmf-building-map-msgs rmf-traffic rmf-traffic-msgs rmf-traffic-ros2 rmf-visualization-msgs rosidl-default-generators visualization-msgs websocketpp ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A visualizer for trajectories in rmf schedule'';
    license = with lib.licenses; [ asl20 ];
  };
}
