
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, velodyne-driver, velodyne-laserscan, velodyne-msgs, velodyne-pointcloud }:
buildRosPackage {
  pname = "ros-rolling-velodyne";
  version = "2.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "velodyne-release";
    rev = "4eb92442085e7b728e040aae3e945fdcaa90a96a";
    owner = "ros2-gbp";
    sha256 = "sha256-Wr9qH+muZay+hoPYPI7pJRs11jWr4I26LKKsmaWL/4A=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ velodyne-driver velodyne-laserscan velodyne-msgs velodyne-pointcloud ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Basic ROS support for the Velodyne 3D LIDARs.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
