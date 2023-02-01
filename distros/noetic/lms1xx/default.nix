
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosconsole-bridge, roscpp, roscpp-serialization, roslaunch, roslint, rosunit, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-lms1xx";
  version = "0.3.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "lms1xx-release";
    rev = "7d76acebd2d8a32c8cf1a45d7e89c69311519b47";
    owner = "clearpath-gbp";
    sha256 = "sha256-3L+mj7WIM7ZasReF+lKT07BZb0+TLo41dgASpnCEq60=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch roslint rosunit ];
  propagatedBuildInputs = [ rosconsole-bridge roscpp roscpp-serialization sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The lms1xx package contains a basic ROS driver for the SICK LMS1xx line of LIDARs.'';
    license = with lib.licenses; [ "LGPL" ];
  };
}
