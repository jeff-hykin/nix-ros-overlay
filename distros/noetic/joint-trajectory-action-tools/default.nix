
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joint-trajectory-action, pr2-controllers-msgs, roslib, rospy, trajectory-msgs }:
buildRosPackage {
  pname = "ros-noetic-joint-trajectory-action-tools";
  version = "0.0.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_common_actions-release";
    rev = "a91c301c50df2f36987f34f2c8d6ddc3fc15e1ec";
    owner = "pr2-gbp";
    sha256 = "sha256-syBo0jBAN77I2sQ7h3k1LPP9KVliS0WNkRCnnSOZk+4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ joint-trajectory-action pr2-controllers-msgs roslib rospy trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''joint_trajectory_action_tools'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
