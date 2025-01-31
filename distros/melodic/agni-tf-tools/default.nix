
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, qt5, roscpp, rviz, tf2-geometry-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-melodic-agni-tf-tools";
  version = "0.1.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "agni_tf_tools-release";
    rev = "ec1ecaa3c98aab6c60bf5e1ddb862d0adf7e714d";
    owner = "ubi-agni-gbp";
    sha256 = "sha256-ANse47fGab2q9ILqK5dUHib1zRpQOvNxAKBNsp6zy10=";
  };

  buildType = "catkin";
  buildInputs = [ catkin eigen qt5.qtbase ];
  propagatedBuildInputs = [ roscpp rviz tf2-geometry-msgs tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides a gui program as well as a rviz plugin to publish static transforms.
  Both support the transformation between various Euler angle representations.
  The rviz plugin also allows to configure the transform with an interactive marker.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
