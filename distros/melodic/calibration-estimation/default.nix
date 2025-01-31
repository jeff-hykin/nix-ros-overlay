
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, calibration-msgs, catkin, python-orocos-kdl, pythonPackages, rospy, rostest, sensor-msgs, urdfdom-py, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-calibration-estimation";
  version = "0.10.14";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "calibration-release";
    rev = "82022131149d661ac202ed05f25c4afa280cd50f";
    owner = "ros-gbp";
    sha256 = "sha256-2WpVp6ZScp1/bYAZgL50txdPS7J3+AxWYlz2j/6z7cQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ calibration-msgs python-orocos-kdl pythonPackages.matplotlib pythonPackages.scipy rospy rostest sensor-msgs urdfdom-py visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Runs an optimization to estimate the a robot's kinematic parameters. This package is a
    generic rewrite of pr2_calibration_estimation.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
