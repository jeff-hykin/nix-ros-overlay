
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, pythonPackages, rospy, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-razor-imu-9dof";
  version = "1.3.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "razor_imu_9dof-release";
    rev = "c9240056483ec75d878ed3c0b455a79a63a7e663";
    owner = "ENSTABretagneRobotics";
    sha256 = "sha256-Rw43NOBQa8g1j28eWJtP1kpR8oEEMBxehjwTafyOkTg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pythonPackages.catkin-pkg ];
  propagatedBuildInputs = [ dynamic-reconfigure pythonPackages.pyserial rospy sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''razor_imu_9dof is a package that provides a ROS driver for the Sparkfun OpenLog Artemis, 9DoF Razor IMU M0, 9DOF Razor IMU and 9DOF Sensor Stick. It also provides Arduino firmware that runs on the board, and which must be installed on it for the system to work. A node which displays the attitude (roll, pitch and yaw) of the board (or any IMU) is provided for testing.'';
    license = with lib.licenses; [ bsdOriginal gpl3Only ];
  };
}
