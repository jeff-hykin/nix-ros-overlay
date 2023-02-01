
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, geometry-msgs, nav-msgs, roscpp, rostest, sensor-msgs, stage, std-msgs, std-srvs, tf }:
buildRosPackage {
  pname = "ros-noetic-stage-ros";
  version = "1.8.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "stage_ros-release";
    rev = "69e425533130f0d16d8ba6395f74cd65e10e6e05";
    owner = "ros-gbp";
    sha256 = "sha256-8N+wPzN7yC0rVdaTnq/17aCyQfsbCgLafRrgfPjgous=";
  };

  buildType = "catkin";
  buildInputs = [ catkin rostest ];
  propagatedBuildInputs = [ boost geometry-msgs nav-msgs roscpp sensor-msgs stage std-msgs std-srvs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides ROS specific hooks for stage'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
