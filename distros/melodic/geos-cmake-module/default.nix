
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-geos-cmake-module";
  version = "0.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "geos_cmake_module-release";
    rev = "a9fb62afcca6ce99fc2e79ace0a214f0411c03dd";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-FDRKdYdEgfAGl4bDOmWs08kLCyq6aLruF/ASxeJvagM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''cmake module for using the libgeos geometry library with ROS'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
