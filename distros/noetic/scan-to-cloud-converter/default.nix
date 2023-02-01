
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pcl, pcl-conversions, pcl-ros, roscpp }:
buildRosPackage {
  pname = "ros-noetic-scan-to-cloud-converter";
  version = "0.3.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "scan_tools-release";
    rev = "cca11edf40c9eb9fb36386fee9261c379d3f5d50";
    owner = "ros-gbp";
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
