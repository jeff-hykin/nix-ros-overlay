
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, geometry-msgs, mavros, mavros-msgs, rospy, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-tello-driver";
  version = "1.3.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "drones-release";
    rev = "2b955de4f053b3fd4b1fd63f4e5098ce528415d0";
    owner = "JdeRobot";
    sha256 = "sha256-DAj7Ke8+bmz03Kgh9eTKyZhkwHMouKmPscHa+KGydPE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs mavros mavros-msgs rospy sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The tello_driver package'';
    license = with lib.licenses; [ mit ];
  };
}
