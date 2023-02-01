
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, turtlebot3-automatic-parking, turtlebot3-automatic-parking-vision, turtlebot3-follow-filter, turtlebot3-follower, turtlebot3-panorama }:
buildRosPackage {
  pname = "ros-melodic-turtlebot3-applications";
  version = "1.1.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3_applications-release";
    rev = "230fea52e6951953ce76d0367d14b0c3100392c5";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-ntZondLOMQNUAEtU/tjDXJH5Z25icSLQFoc+Om6MxbY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ turtlebot3-automatic-parking turtlebot3-automatic-parking-vision turtlebot3-follow-filter turtlebot3-follower turtlebot3-panorama ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS packages for the turtlebot3 applications (meta package)'';
    license = with lib.licenses; [ asl20 bsdOriginal ];
  };
}
