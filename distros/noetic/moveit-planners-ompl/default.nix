
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, moveit-core, moveit-resources-fanuc-description, moveit-resources-panda-description, moveit-resources-pr2-description, moveit-ros-planning, ompl, pluginlib, rosconsole, roscpp, rostest, rosunit, tf2, tf2-eigen }:
buildRosPackage {
  pname = "ros-noetic-moveit-planners-ompl";
  version = "1.1.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "moveit-release";
    rev = "9ee6644b3783b7e3151ae4e5cc42b19eddfe4635";
    owner = "ros-gbp";
    sha256 = "sha256-05oUeexcOY+aUrx9TjFqf6iqE3YS//bsE+6AbxGsbVw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ moveit-resources-fanuc-description moveit-resources-panda-description moveit-resources-pr2-description rostest rosunit tf2-eigen ];
  propagatedBuildInputs = [ dynamic-reconfigure moveit-core moveit-ros-planning ompl pluginlib rosconsole roscpp tf2 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''MoveIt interface to OMPL'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
