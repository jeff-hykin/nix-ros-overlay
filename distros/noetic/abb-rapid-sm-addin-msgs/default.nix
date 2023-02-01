
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, abb-rapid-msgs, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-abb-rapid-sm-addin-msgs";
  version = "0.5.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "abb_robot_driver_interfaces-release";
    rev = "4bca27cf057c7de09d62ddb80aef2e051f48604b";
    owner = "ros-industrial-release";
    sha256 = "sha256-ZAZUq1W0+r5nOaUZNkiT8goHvJ2LFDQZC5i/aOGCq90=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ abb-rapid-msgs message-generation message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Provides ROS message and service definitions, representing interaction
    with ABB robot controllers using the RobotWare StateMachine Add-In.'';
    license = with lib.licenses; [ bsd3 ];
  };
}
