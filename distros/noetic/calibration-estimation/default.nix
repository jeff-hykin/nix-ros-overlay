
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, calibration-msgs, catkin, python3Packages, rospy, rostest, sensor-msgs, urdfdom-py, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-calibration-estimation";
  version = "0.10.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "calibration-release";
    rev = "905bc1ff95a02deea0c21defa8cd0ca4eb7f8f21";
    owner = "ros-gbp";
    sha256 = "sha256-zA++EMqqTySSrx2yPtv1cQUiUjqe7nk5G/9wkuxw5OQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ calibration-msgs python3Packages.matplotlib python3Packages.pykdl python3Packages.scipy rospy rostest sensor-msgs urdfdom-py visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Runs an optimization to estimate the a robot's kinematic parameters. This package is a
    generic rewrite of pr2_calibration_estimation.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
