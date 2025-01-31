
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, cv-bridge, eigen, geometry-msgs, image-transport, nav-msgs, roscpp, rospy, sensor-msgs, std-msgs, std-srvs, turtlebot3-applications-msgs, turtlebot3-bringup }:
buildRosPackage {
  pname = "ros-melodic-turtlebot3-panorama";
  version = "1.1.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3_applications-release";
    rev = "e872c946c4438680caeb42f60cf14d5194e8ee6a";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-w2cbDSS9R4jMnxbOFPuNfHLGrKkSosQ+6m1e/vzk7Xg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cmake-modules cv-bridge eigen geometry-msgs image-transport nav-msgs roscpp rospy sensor-msgs std-msgs std-srvs turtlebot3-applications-msgs turtlebot3-bringup ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This app utilises pano_ros for taking snapshots and stitching them together to create panorama pictures.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
