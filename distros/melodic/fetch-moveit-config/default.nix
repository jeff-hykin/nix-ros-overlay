
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, fetch-description, fetch-ikfast-plugin, joint-state-publisher, moveit-fake-controller-manager, moveit-kinematics, moveit-planners-ompl, moveit-python, moveit-ros-move-group, moveit-ros-visualization, moveit-simple-controller-manager, robot-state-publisher, rospy, rostest, xacro }:
buildRosPackage {
  pname = "ros-melodic-fetch-moveit-config";
  version = "0.8.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fetch_ros-release";
    rev = "e0da232e718ea29ccaa06b3bb5144a7277c9902b";
    owner = "fetchrobotics-gbp";
    sha256 = "sha256-EEcOEWRfwJRab1Rb4jHbPzaaaUymj4HpVgqRHCySmX4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest ];
  propagatedBuildInputs = [ fetch-description fetch-ikfast-plugin joint-state-publisher moveit-fake-controller-manager moveit-kinematics moveit-planners-ompl moveit-python moveit-ros-move-group moveit-ros-visualization moveit-simple-controller-manager robot-state-publisher rospy xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''An automatically generated package with all the configuration and launch files for using the fetch_urdf with the MoveIt Motion Planning Framework'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
