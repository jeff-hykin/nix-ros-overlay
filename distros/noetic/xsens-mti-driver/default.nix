
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, roscpp, sensor-msgs, std-msgs, tf2, tf2-ros }:
buildRosPackage {
  pname = "ros-noetic-xsens-mti-driver";
  version = "0.2021.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "xsens_mti_driver-release";
    rev = "1e8bdec7dda1c6f95a25e76703dfc906e8939a3b";
    owner = "nobleo";
    sha256 = "sha256-HztoB95azdiMIm5XbAPjQh4dTj27DgG9g1RjoAwa5aI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs roscpp sensor-msgs std-msgs tf2 tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS driver for Xsens MTi IMU sensors'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
