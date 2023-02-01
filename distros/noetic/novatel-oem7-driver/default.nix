
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, gps-common, nav-msgs, nmea-msgs, nodelet, novatel-oem7-msgs, rosbag, roscpp, rostest, sensor-msgs, tf2-geometry-msgs }:
buildRosPackage {
  pname = "ros-noetic-novatel-oem7-driver";
  version = "4.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "novatel_oem7_driver-release";
    rev = "1b006bacafd1c773064eb035c1929d40b5e7e9b7";
    owner = "novatel-gbp";
    sha256 = "sha256-BrUlfFnQumacDophH1Itb+HJ0Bwzjk7/GReqnBWKzZs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rosbag rostest ];
  propagatedBuildInputs = [ boost gps-common nav-msgs nmea-msgs nodelet novatel-oem7-msgs roscpp sensor-msgs tf2-geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''NovAtel Oem7 ROS Driver'';
    license = with lib.licenses; [ mit ];
  };
}
