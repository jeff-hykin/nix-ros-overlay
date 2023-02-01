
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, libspnav, roscpp, roslint, sensor-msgs, spacenavd, xorg }:
buildRosPackage {
  pname = "ros-melodic-spacenav-node";
  version = "1.14.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "joystick_drivers-release";
    rev = "7de740ac7ef82c28226c04deaf621f3154ed78a3";
    owner = "ros-gbp";
    sha256 = "sha256-HujxkzCVr6HCoNGtZNd9xBXnAJ01xvHZ9bA60EAUMfI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint ];
  propagatedBuildInputs = [ geometry-msgs libspnav roscpp sensor-msgs spacenavd xorg.libX11 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS interface to the 3Dconnexion SpaceNavigator 6DOF joystick.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
