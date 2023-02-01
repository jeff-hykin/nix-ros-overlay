
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, geometry-msgs, graph-msgs, moveit-common, moveit-core, moveit-ros-planning, rclcpp, rviz-visual-tools, std-msgs, tf2-eigen, tf2-ros, trajectory-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-galactic-moveit-visual-tools";
  version = "4.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "moveit_visual_tools-release";
    rev = "84e23b51ff9beee43de7e026d7ce65ccecc7b366";
    owner = "moveit";
    sha256 = "sha256-d7g5RYJQrY6hKNax+XQHoJ8Mm1PpFRvcXKCQr/hGO5w=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs graph-msgs moveit-common moveit-core moveit-ros-planning rclcpp rviz-visual-tools std-msgs tf2-eigen tf2-ros trajectory-msgs visualization-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Helper functions for displaying and debugging MoveIt data in Rviz via published markers'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
