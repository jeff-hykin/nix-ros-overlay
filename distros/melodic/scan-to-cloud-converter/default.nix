
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pcl, pcl-conversions, pcl-ros, roscpp }:
buildRosPackage {
  pname = "ros-melodic-scan-to-cloud-converter";
  version = "0.3.3-r2";

  src = fetchurl {
    url = "https://github.com/ros-gbp/scan_tools-release/archive/f852d2c24155358e9000fb08149f2a6e1939f146.tar.gz";
    sha256 = "sha256-PbqPH8KR7i6Einlcettf0P73PN7E67K96puohcJPUn4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pcl pcl-conversions pcl-ros roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Converts LaserScan to PointCloud messages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
