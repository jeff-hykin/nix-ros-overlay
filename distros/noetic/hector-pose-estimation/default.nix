
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, hector-pose-estimation-core, message-filters, nav-msgs, nodelet, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-noetic-hector-pose-estimation";
  version = "0.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_localization-release";
    rev = "e0795954becbbb504cd7f94f70128d4d1ef0a486";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-pw8PPnGzACmgrtfBmYPTE5hI0dRX9+g0TWlaDWsPQ/o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs hector-pose-estimation-core message-filters nav-msgs nodelet sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_pose_estimation provides the hector_pose_estimation node and the hector_pose_estimation nodelet.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
