
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, kdl-parser, robot-state-publisher, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-dynamic-robot-state-publisher";
  version = "1.1.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dynamic_robot_state_publisher-release";
    rev = "5bd979bbaf5074fcbe238b147f8f43119b05c792";
    owner = "peci1";
    sha256 = "sha256-EmDpoWBb6zz4LdPdP3HWXsKRRfIVf8mo+439mgi/Cxc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure kdl-parser robot-state-publisher roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Improved ROS robot_state_publisher which can update the robot model via dynamic_reconfigure.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
