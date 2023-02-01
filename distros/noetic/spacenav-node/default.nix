
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, libspnav, roscpp, roslint, sensor-msgs, xorg }:
buildRosPackage {
  pname = "ros-noetic-spacenav-node";
  version = "1.15.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "joystick_drivers-release";
    rev = "fccf352152e5d89a8dd69c50a9d6b7aa2af6c095";
    owner = "ros-gbp";
    sha256 = "sha256-yOi02IrhCc33VsQX0QO4nm0HAZnDJoaOTNWIsVezA0k=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint ];
  propagatedBuildInputs = [ geometry-msgs libspnav roscpp sensor-msgs xorg.libX11 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS interface to the 3Dconnexion SpaceNavigator 6DOF joystick.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
