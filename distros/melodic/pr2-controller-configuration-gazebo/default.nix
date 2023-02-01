
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo, pr2-controller-manager, pr2-gripper-action, pr2-head-action, single-joint-position-action }:
buildRosPackage {
  pname = "ros-melodic-pr2-controller-configuration-gazebo";
  version = "2.0.14";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_simulator-release";
    rev = "219a3db2f470694cf0891863a9a53d04acfd8f5d";
    owner = "pr2-gbp";
    sha256 = "sha256-vSErMQX2kpoZCt2mo7BVrfoKyIWQODl1YEL52v397aE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo pr2-controller-manager pr2-gripper-action pr2-head-action single-joint-position-action ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A copy of the pr2_controller_configuration package, for use in 
    the PR2 simulator.  We maintain two copies to allow for controller
    gains to be set differently between hardware and simulation.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
