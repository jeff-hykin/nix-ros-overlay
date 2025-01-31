
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ceres-solver, eigen, eigen-conversions, geometry-msgs, hector-trajectory-server, nav-msgs, nodelet, pcl, pcl-ros, rosbag, roscpp, rospy, sensor-msgs, std-msgs, tf2, tf2-geometry-msgs }:
buildRosPackage {
  pname = "ros-melodic-floam";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "floam-release";
    rev = "3ef0e0c61fa652b044b7099bd1f5f3422ac81ca8";
    owner = "flynneva";
    sha256 = "sha256-SA+takXbqkSJibyAiw43/eYnsDSb2bN9Lid7Wn87OtU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ceres-solver eigen eigen-conversions geometry-msgs hector-trajectory-server nav-msgs nodelet pcl pcl-ros rosbag roscpp rospy sensor-msgs std-msgs tf2 tf2-geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A generic Lidar SLAM package based on FLOAM which was based on ALOAM by HKUST and LOAM by CMU'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
