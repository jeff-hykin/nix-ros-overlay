
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-updater, roscpp, self-test, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-lsc-ros-driver";
  version = "1.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "lsc_ros_driver-release";
    rev = "60d2f9cc6f291735b4a6e3139c3e608234a8eb8e";
    owner = "AutonicsLiDAR-release";
    sha256 = "sha256-xYpSqVbtrXn/3u/Xxe7aYYJnOGgMohZ2Chgf/aTFFZo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin diagnostic-updater self-test ];
  propagatedBuildInputs = [ roscpp sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS driver package for LSC-C Series'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
