
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, can-msgs, catkin, dataspeed-can-msg-filters, dataspeed-can-usb, dataspeed-ulc-can, dbw-fca-description, dbw-fca-msgs, geometry-msgs, nodelet, roscpp, roslaunch, rospy, sensor-msgs, socketcan-bridge, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-dbw-fca-can";
  version = "1.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dbw_fca_ros-release";
    rev = "45ed9c51be364d60635aa4fc00180942cecf80fc";
    owner = "DataspeedInc-release";
    sha256 = "sha256-3oae3i+Le894UArl9843cH/mIt5LJqFMbI4eG9a8z3I=";
  };

  buildType = "catkin";
  buildInputs = [ catkin dataspeed-can-msg-filters ];
  checkInputs = [ roslaunch ];
  propagatedBuildInputs = [ can-msgs dataspeed-can-usb dataspeed-ulc-can dbw-fca-description dbw-fca-msgs geometry-msgs nodelet roscpp roslaunch rospy sensor-msgs socketcan-bridge std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Drive-by-wire interface to the Dataspeed Inc. Chrysler Pacifica DBW kit'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
