
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, joint-state-controller, joint-trajectory-controller, khi-duaro-description, khi-duaro-moveit-config, khi-robot-control, position-controllers, robot-state-publisher, roslaunch, rostest, tf }:
buildRosPackage {
  pname = "ros-melodic-khi-robot-bringup";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "khi_robot-release";
    rev = "a1230e091fdf2e0ab839a640fbbe6a2d50a6368f";
    owner = "Kawasaki-Robotics";
    sha256 = "sha256-IiMzL8VOt8SxNp3rDou9JBa8XyqSgIqaTJlvwH5FT5c=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ controller-manager joint-state-controller joint-trajectory-controller khi-duaro-description khi-duaro-moveit-config khi-robot-control position-controllers robot-state-publisher tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package contains bringup scripts/config/tools for KHI Robot'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
