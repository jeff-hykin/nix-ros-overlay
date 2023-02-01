
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rosconsole-bridge, roscpp, roscpp-serialization, roslaunch, roslint, rosunit, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-lms1xx";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "lms1xx-release";
    rev = "2b7361cb6e91de496c21c0a19e0e3a124be4195d";
    owner = "clearpath-gbp";
    sha256 = "sha256-RoVS+LmbbntTHC9E8JpczFQvDkhUsv/K2qWJ9EUZ0nQ=";
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
