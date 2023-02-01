
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, nav-msgs, robot-state-publisher, roscpp, sensor-msgs, std-msgs, tf, turtlebot3-msgs }:
buildRosPackage {
  pname = "ros-melodic-turtlebot3-fake";
  version = "1.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3_simulations-release";
    rev = "93877f9506470244896215af41a8cdab7576a729";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-k2Oo4SH8RFCFB+EJq5pu/h5ADYDLii9RzVkj47Zoep8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs robot-state-publisher roscpp sensor-msgs std-msgs tf turtlebot3-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package for TurtleBot3 fake node. With this package, simple tests can be done without a robot.
    You can do simple tests using this package on rviz without real robots.'';
    license = with lib.licenses; [ asl20 ];
  };
}
