
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, diagnostic-msgs, pluginlib, pr2-controller-interface, pr2-description, pr2-hardware-interface, pr2-mechanism-diagnostics, pr2-mechanism-model, pr2-mechanism-msgs, realtime-tools, robot-state-publisher, roscpp, roslaunch, rosparam, rospy, rostest, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-pr2-controller-manager";
  version = "1.8.21-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_mechanism-release";
    rev = "fdedf6b891044bfed152af919443d2c62164dd20";
    owner = "pr2-gbp";
    sha256 = "sha256-T3qmvTLPyz+4l0cVVa1e8w87sgtoWWWmHLmvchpvI54=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules rostest ];
  checkInputs = [ roslaunch ];
  propagatedBuildInputs = [ diagnostic-msgs pluginlib pr2-controller-interface pr2-description pr2-hardware-interface pr2-mechanism-diagnostics pr2-mechanism-model pr2-mechanism-msgs realtime-tools robot-state-publisher roscpp rosparam rospy sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The controller manager (CM) package provides the infrastructure to run controllers in a hard realtime loop.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
