
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, bcap-service, catkin, roscpp }:
buildRosPackage {
  pname = "ros-melodic-bcap-service-test";
  version = "3.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "denso_robot_ros-release";
    rev = "e00e81319d26f9ca42514e77f5fcc8838e22abee";
    owner = "DENSORobot";
    sha256 = "sha256-qI2GWnrnY0FMlBsSx6P93n3bUD/9V5WsZN6QXtXqsVM=";
  };

  buildType = "catkin";
  buildInputs = [ bcap-service catkin ];
  propagatedBuildInputs = [ roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The bcap service test package includes a node for testing bcap service node.'';
    license = with lib.licenses; [ mit ];
  };
}
