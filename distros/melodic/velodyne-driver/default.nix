
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-updater, dynamic-reconfigure, libpcap, nodelet, pluginlib, roscpp, roslaunch, rostest, tf, velodyne-msgs }:
buildRosPackage {
  pname = "ros-melodic-velodyne-driver";
  version = "1.5.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "velodyne-release";
    rev = "3115c1005942f294e2e413228f6ca42cdbfcf87d";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-Pl2QWcrh7JTfTo/orjTjo2l7sELrKMHTL9+XVp/U7wI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ diagnostic-updater dynamic-reconfigure libpcap nodelet pluginlib roscpp tf velodyne-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS device driver for Velodyne 3D LIDARs.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
