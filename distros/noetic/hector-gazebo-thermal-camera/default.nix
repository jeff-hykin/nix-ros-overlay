
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo, gazebo-plugins, roscpp }:
buildRosPackage {
  pname = "ros-noetic-hector-gazebo-thermal-camera";
  version = "0.5.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_gazebo-release";
    rev = "b5f64075887769fb3a0b0b66751049d30b411028";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-6h4wPMO/Rda03LKTTNKb35YD/xj0BKpHeKTj+F/tG74=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo gazebo-plugins roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_gazebo_thermal_camera provides a gazebo plugin that produces simulated thermal camera images. The plugin uses modified code from the gazebo_ros_camera plugin.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
