
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, easy-markers, geometry-msgs, kalman-filter, leg-detector, people-msgs, roslaunch, roslib, roslint, rospy }:
buildRosPackage {
  pname = "ros-noetic-people-velocity-tracker";
  version = "1.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "people-release";
    rev = "5be6183fe88c77d7ce190cfa6d6d4431872cfe43";
    owner = "OSUrobotics";
    sha256 = "sha256-XWtQPrQ9iU+nUy4kgWbjxyxME7P9n2dT5WqsdSLp9qI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch roslint ];
  propagatedBuildInputs = [ easy-markers geometry-msgs kalman-filter leg-detector people-msgs roslib rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Track the output of the leg_detector to indicate the velocity of person.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
