
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, flexbe-core, flexbe-msgs, rospy, rostest }:
buildRosPackage {
  pname = "ros-melodic-flexbe-onboard";
  version = "1.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "flexbe_behavior_engine-release";
    rev = "99d198999e5e232b955102c6d5f3036cf5cb2ae3";
    owner = "FlexBE";
    sha256 = "sha256-F4Po6AOQNmweidPtk4tbz9y8fQ8XiiTZKBMtQiIacng=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rostest ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''flexbe_onboard implements the robot-side of the behavior engine from where all behaviors are started.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
