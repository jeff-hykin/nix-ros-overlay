
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rospack }:
buildRosPackage {
  pname = "ros-noetic-rosbash";
  version = "1.15.8-r1";

  src = fetchurl {
    # https://github.com/ros-gbp/ros-release/
    url = "https://github.com/ros-gbp/ros-release/archive/bda9f415771aa41dddd81bfaa8e31a2c038524ef.tar.gz";
    name = "1.15.8-1.tar.gz";
    sha256 = "sha256-hYg5AE15i4XUL85FMdMyTzh9HBXtUK2LAJmLABo3N/c=";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ catkin rospack ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Assorted shell commands for using ros with bash.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
