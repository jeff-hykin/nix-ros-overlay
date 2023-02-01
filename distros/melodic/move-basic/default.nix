
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, dynamic-reconfigure, geometry-msgs, message-generation, message-runtime, move-base-msgs, nav-core, roscpp, rostest, sensor-msgs, std-msgs, tf2, tf2-geometry-msgs, tf2-ros, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-move-basic";
  version = "0.4.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "move_basic-release";
    rev = "64a4c4ab5f2c0db5a10c51aa933efcec47cf80bd";
    owner = "UbiquityRobotics-release";
    sha256 = "sha256-dJNWbtCqjd8Dz9r3wFWL914lKbDmURmxmuQeVX3yRY4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib actionlib-msgs dynamic-reconfigure geometry-msgs message-generation message-runtime move-base-msgs nav-core roscpp rostest sensor-msgs std-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Simple navigation package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
