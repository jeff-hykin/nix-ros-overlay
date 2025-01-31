
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, moveit-kinematics, moveit-planners-ompl, moveit-ros-visualization, rviz2, urdf, xacro }:
buildRosPackage {
  pname = "ros-foxy-ur-moveit-config";
  version = "2.0.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "Universal_Robots_ROS2_Driver-release";
    rev = "44baafab00c3607e73b37c353a33577a2d69714d";
    owner = "ros2-gbp";
    sha256 = "sha256-YtEPp8eTlCzLNm5Xsx6wJkcJrMB4PBjQUwUumhfryfw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-kinematics moveit-planners-ompl moveit-ros-visualization rviz2 urdf xacro ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''An example package with MoveIt2 configurations for UR robots.'';
    license = with lib.licenses; [ asl20 ];
  };
}
