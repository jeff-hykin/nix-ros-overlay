
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-interface, pluginlib, realtime-tools, speed-scaling-interface, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-speed-scaling-state-controller";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "Universal_Robots_ROS_scaled_controllers-release";
    rev = "032828c176dd09b3f9331ac9096a1d38af384cfc";
    owner = "UniversalRobots";
    sha256 = "sha256-LQzmbPK2YP+cx6MepxteuUjH1xBKImkgbuWvZVWOG5g=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ controller-interface pluginlib realtime-tools speed-scaling-interface std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS controller providing reading the state of speed scaling on the robot'';
    license = with lib.licenses; [ asl20 ];
  };
}
