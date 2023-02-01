
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joint-state-publisher-gui, robot-state-publisher, roslaunch, rviz, urdf, xacro }:
buildRosPackage {
  pname = "ros-melodic-ur-description";
  version = "1.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "universal_robot-release";
    rev = "66a22770e5d8cf4956fe3f56f60db9513d1464b6";
    owner = "ros-industrial-release";
    sha256 = "sha256-oBfwM4xdLzEP2wgCWkIfMCPQDILmVaxIayQJOLucr5I=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch ];
  propagatedBuildInputs = [ joint-state-publisher-gui robot-state-publisher rviz urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''URDF description for Universal UR3(e), UR5(e), UR10(e) and UR16e robots'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
