
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, irobot-create-gazebo-bringup, irobot-create-gazebo-plugins }:
buildRosPackage {
  pname = "ros-galactic-irobot-create-gazebo-sim";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "create3_sim-release";
    rev = "7af534ee286035e9800561c61faca29280b27ab1";
    owner = "ros2-gbp";
    sha256 = "sha256-eh7VHTCRIYVAP9k6Ra/37th5pYmT0mSwhjURnDi+me0=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-gazebo-bringup irobot-create-gazebo-plugins ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Metapackage for the iRobot(R) Create(R) 3 robot Gazebo simulator<a href="http://gazebosim.org/">Gazebo</a> simulation stack.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
