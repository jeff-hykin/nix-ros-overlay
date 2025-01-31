
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, nmea-msgs, roscpp, roslaunch, roslint, rostest }:
buildRosPackage {
  pname = "ros-noetic-nmea-comms";
  version = "1.2.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "nmea_comms-release";
    rev = "8f62482358f88e98351f8a3d4a392cf279c55285";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-9vpACLn+DEJ/FvjqANRAnOPnY/OqUbmBIxzKguC+Vok=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslaunch roslint rostest ];
  propagatedBuildInputs = [ nmea-msgs roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The nmea_comms package provides helper nodes for transmitting and receiving
    the NMEA sentences.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
