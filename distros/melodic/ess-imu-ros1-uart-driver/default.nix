
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, roscpp, sensor-msgs, std-msgs, tf2 }:
buildRosPackage {
  pname = "ros-melodic-ess-imu-ros1-uart-driver";
  version = "1.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ess_imu_ros1_uart_driver-release";
    rev = "2b9d6fbd241c8e5d28a1664c7e85ff0f0626b9a5";
    owner = "cubicleguy";
    sha256 = "sha256-lKTY40ilPKvGfTF0wYF9q0Acp6eAdeqTOTsgNaPjRtA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs roscpp sensor-msgs std-msgs tf2 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The Epson IMU Driver using UART interface for ROS package'';
    license = with lib.licenses; [ bsdOriginal publicDomain ];
  };
}
