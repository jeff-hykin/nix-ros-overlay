
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, pcl-conversions, pcl-msgs, pcl-ros }:
buildRosPackage {
  pname = "ros-foxy-perception-pcl";
  version = "2.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "perception_pcl-release";
    rev = "8c7c28bbab236e351e6bdbf4eded8262f9eea9c8";
    owner = "ros2-gbp";
    sha256 = "sha256-RlKY5Znn1hwoNu+cU09p8tlXjk12J/YuoCrek/27IRI=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pcl-conversions pcl-msgs pcl-ros ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''PCL (Point Cloud Library) ROS interface stack. PCL-ROS is the preferred
  bridge for 3D applications involving n-D Point Clouds and 3D geometry
  processing in ROS.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
