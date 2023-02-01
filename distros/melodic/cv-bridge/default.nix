
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, opencv, python, pythonPackages, rosconsole, rostest, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-cv-bridge";
  version = "1.13.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vision_opencv-release";
    rev = "acb9dc2a951d5e54495f8fdc246a77b6a094549d";
    owner = "ros-gbp";
    sha256 = "sha256-b4OAdu9KXs5cynJt8w7pOyDs1JYI1P3UphcKGRoakfU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ pythonPackages.numpy rostest ];
  propagatedBuildInputs = [ boost opencv python pythonPackages.opencv3 rosconsole sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This contains CvBridge, which converts between ROS
    Image messages and OpenCV images.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
