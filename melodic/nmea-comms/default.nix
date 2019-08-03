
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, roslint, catkin, rostest, roslaunch, roscpp, nmea-msgs }:
buildRosPackage {
  pname = "ros-melodic-nmea-comms";
  version = "1.2.0";

  src = fetchurl {
    url = https://github.com/ros-drivers-gbp/nmea_comms-release/archive/release/melodic/nmea_comms/1.2.0-0.tar.gz;
    sha256 = "c8d4fd98cc921339daf7612d5d5b087f1922e0a79dea4561f483cfbb6a1b5db2";
  };

  buildInputs = [ roslint rostest roslaunch roscpp nmea-msgs ];
  propagatedBuildInputs = [ roscpp nmea-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The nmea_comms package provides helper nodes for transmitting and receiving
    the NMEA sentences.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
