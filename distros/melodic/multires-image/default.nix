
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, geometry-msgs, gps-common, mapviz, pluginlib, qt5, roscpp, rospy, swri-math-util, swri-transform-util, swri-yaml-util, tf }:
buildRosPackage {
  pname = "ros-melodic-multires-image";
  version = "1.4.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mapviz-release";
    rev = "43194d6149e4bd374bcb5522f062c0ddc04f50e5";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-aHgyyFOdYXhYq5wpO2N6SaGl5xFqZviBbhp8xYP8Ogg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs gps-common mapviz pluginlib qt5.qtbase roscpp rospy swri-math-util swri-transform-util swri-yaml-util tf ];
  nativeBuildInputs = [ catkin qt5.qtbase ];

  meta = {
    description = ''multires_image'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
