
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, control-msgs, moveit-msgs, moveit-planners-ompl, pr2-gazebo, pr2-moveit-config, pr2-moveit-plugins, pr2eus, roseus, rostest }:
buildRosPackage {
  pname = "ros-melodic-pr2eus-moveit";
  version = "0.3.14-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_pr2eus-release";
    rev = "8d296dc4409e9a8da407f6a2df6aaac6cf999013";
    owner = "tork-a";
    sha256 = "sha256-WVK0pjBdxMTp1ppyi43PilQBC5ZMAXU3WLPWFp8ownY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ moveit-planners-ompl pr2-gazebo pr2-moveit-config pr2-moveit-plugins rostest ];
  propagatedBuildInputs = [ control-msgs moveit-msgs pr2eus roseus ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''pr2eus_moveit'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
