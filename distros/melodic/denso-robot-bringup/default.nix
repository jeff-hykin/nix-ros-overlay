
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-denso-robot-bringup";
  version = "3.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "denso_robot_ros-release";
    rev = "ede5c27f7cd5a958524936917f6428b41b586696";
    owner = "DENSORobot";
    sha256 = "sha256-2AJfaTX2ERqPK+fQceqwlqknUg0opP74rxTPPr0zMZc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The denso robot bringup package includes launch files for starting denso robot nodes.'';
    license = with lib.licenses; [ mit ];
  };
}
