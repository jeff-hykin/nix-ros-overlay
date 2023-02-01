
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, amcl, catkin, map-server, move-base, turtlebot3-bringup }:
buildRosPackage {
  pname = "ros-noetic-turtlebot3-navigation";
  version = "1.2.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3-release";
    rev = "d8c2d1269617b8136b72fdb79d30b03d670eee81";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-CdHx+SA0zxRVGqbt5ZBOrh/gFc5Y11kM1jTu6q0vAMU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ amcl map-server move-base turtlebot3-bringup ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The turtlebot3_navigation provides roslaunch scripts for starting the navigation.'';
    license = with lib.licenses; [ asl20 ];
  };
}
