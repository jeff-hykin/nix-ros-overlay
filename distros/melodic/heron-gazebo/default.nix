
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, hector-gazebo-plugins, heron-msgs, interactive-marker-twist-server, nav-msgs, rospy, sensor-msgs, tf, uuv-gazebo-ros-plugins-msgs, uuv-gazebo-worlds }:
buildRosPackage {
  pname = "ros-melodic-heron-gazebo";
  version = "0.3.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "heron_simulator-release";
    rev = "cee7a4ba08de2e406897fc1f830fff2ef7577788";
    owner = "clearpath-gbp";
    sha256 = "sha256-KFZPVgjfAH0h0zF+UT/GHKw/5eptUiu+l+so5KrObqM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs hector-gazebo-plugins heron-msgs interactive-marker-twist-server nav-msgs rospy sensor-msgs tf uuv-gazebo-ros-plugins-msgs uuv-gazebo-worlds ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Simulator package for Heron'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
