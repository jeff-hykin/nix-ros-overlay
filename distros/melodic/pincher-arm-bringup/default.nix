
# Copyright 2021 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, arbotix-controllers, arbotix-python, catkin, control-msgs, pincher-arm-description, robot-state-publisher, rospy, sensor-msgs, std-msgs, xacro }:
buildRosPackage {
  pname = "ros-melodic-pincher-arm-bringup";
  version = "0.2.0-r1";

  src = fetchurl {
    url = "https://github.com/fictionlab-gbp/pincher_arm-release/archive/release/melodic/pincher_arm_bringup/0.2.0-1.tar.gz";
    name = "0.2.0-1.tar.gz";
    sha256 = "017d7c5373dd32b42e8c6ee119691c56f61cd48eb7532c1dabb0350da70c17ed";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ actionlib arbotix-controllers arbotix-python control-msgs pincher-arm-description robot-state-publisher rospy sensor-msgs std-msgs xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch files for starting PhantomX Pincher arm drivers.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
