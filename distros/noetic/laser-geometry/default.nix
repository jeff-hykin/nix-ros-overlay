
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, boost, catkin, eigen, python3Packages, roscpp, rosunit, sensor-msgs, tf, tf2, tf2-geometry-msgs }:
buildRosPackage {
  pname = "ros-noetic-laser-geometry";
  version = "1.6.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "laser_geometry-release";
    rev = "a58439662477bf4662a911a322d290e758be176a";
    owner = "ros-gbp";
    sha256 = "sha256-KcI82Rd7PWIfEY2IiK5EpWVcf4+HEVcttkFfaTIrH18=";
  };

  buildType = "catkin";
  buildInputs = [ catkin tf2-geometry-msgs ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ angles boost eigen python3Packages.numpy roscpp sensor-msgs tf tf2 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains a class for converting from a 2D laser scan as defined by
    sensor_msgs/LaserScan into a point cloud as defined by sensor_msgs/PointCloud
    or sensor_msgs/PointCloud2. In particular, it contains functionality to account
    for the skew resulting from moving robots or tilting laser scanners.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
