
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, eigen, pluginlib, qt5, rclcpp, resource-retriever, rmf-cmake-uncrustify, rmf-door-msgs, rmf-lift-msgs, rmf-traffic-ros2, rmf-visualization-msgs, rviz-common, rviz-default-plugins, rviz-rendering }:
buildRosPackage {
  pname = "ros-foxy-rmf-visualization-rviz2-plugins";
  version = "1.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_visualization-release";
    rev = "774b11603d6ce5610a311e727dfe860f5cc427e5";
    owner = "ros2-gbp";
    sha256 = "sha256-zR5/3yPfBVaNLDjkYxxAyJuUouKiqCMSK2PTSOkakhM=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake eigen ];
  checkInputs = [ rmf-cmake-uncrustify ];
  propagatedBuildInputs = [ pluginlib qt5.qtbase rclcpp resource-retriever rmf-door-msgs rmf-lift-msgs rmf-traffic-ros2 rmf-visualization-msgs rviz-common rviz-default-plugins rviz-rendering ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A package containing RViz2 plugins for RMF'';
    license = with lib.licenses; [ asl20 ];
  };
}
