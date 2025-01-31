
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, cmake-modules, hardware-interface, kdl-parser, pluginlib, pr2-hardware-interface, roscpp, rostest, rosunit, urdf, urdfdom }:
buildRosPackage {
  pname = "ros-noetic-pr2-mechanism-model";
  version = "1.8.21-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_mechanism-release";
    rev = "eda94139b897b5e59529ff5e9e7633d1e4882185";
    owner = "pr2-gbp";
    sha256 = "sha256-6tOfLbR3ePlkXuPq6m1fg9oasGlrvLgUZYZ0Goj87ws=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules rostest rosunit ];
  propagatedBuildInputs = [ angles hardware-interface kdl-parser pluginlib pr2-hardware-interface roscpp urdf urdfdom ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''<p>
        This package contains the robot model that is used by the realtime
        controllers
        inside <a href="http://www.ros.org/wiki/pr2_controller_manager">controller
           manager</a>. This robot model focuses on controlling the robot
        mechanism in a realtime control loop, and therefore it only contains
        the components of a robot that are relevant in realtime: the robot
        joints (with encoders, transmisisons and actuators) and the
        kinematic/dynamic model of the robot.
     </p>
     <p>
        The pr2_mechanism_model package is well tested and is released with a stable API.
     </p>'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
