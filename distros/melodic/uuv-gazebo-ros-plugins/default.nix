
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-dev, geometry-msgs, roscpp, rostest, rosunit, sensor-msgs, std-msgs, tf2, tf2-ros, uuv-gazebo-plugins, uuv-gazebo-ros-plugins-msgs, visualization-msgs, xacro }:
buildRosPackage {
  pname = "ros-melodic-uuv-gazebo-ros-plugins";
  version = "0.6.13";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uuv_simulator-release";
    rev = "7b82defa4d185107e782fe98db502a1649f7140f";
    owner = "uuvsimulator";
    sha256 = "sha256-zjDY5gS7Cgmze7bGRUlpywyPO98QRfyA7o4VzWAkI4E=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest rosunit xacro ];
  propagatedBuildInputs = [ gazebo-dev geometry-msgs roscpp sensor-msgs std-msgs tf2 tf2-ros uuv-gazebo-plugins uuv-gazebo-ros-plugins-msgs visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''UUV Simulator's extended ROS plugins for generation of the necessary
      ROS services and topics during the simulation.'';
    license = with lib.licenses; [ asl20 ];
  };
}
