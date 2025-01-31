
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, joint-state-publisher, launch, launch-ros, robot-state-publisher, rviz2, urdf, xacro }:
buildRosPackage {
  pname = "ros-foxy-ur-description";
  version = "2.0.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "Universal_Robots_ROS2_Driver-release";
    rev = "8bd938a4ce33ce6019b89c3d6f03e6e29bf68ba5";
    owner = "ros2-gbp";
    sha256 = "sha256-sJMo89gXMtIqD0D3Q7xeJ45vX96t5zhmgGZ/zm0c4NA=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher launch launch-ros robot-state-publisher rviz2 urdf xacro ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''URDF description for Universal Robots'';
    license = with lib.licenses; [ asl20 ];
  };
}
