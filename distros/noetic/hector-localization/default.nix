
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, hector-pose-estimation, hector-pose-estimation-core, message-to-tf }:
buildRosPackage {
  pname = "ros-noetic-hector-localization";
  version = "0.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hector_localization-release";
    rev = "27cd84ecbe0f6b7ace76559eddd16e6d11910007";
    owner = "tu-darmstadt-ros-pkg-gbp";
    sha256 = "sha256-pQgRqbuueJFftxCoKzMuRaskbVqXjNafC31a7fMooeI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ hector-pose-estimation hector-pose-estimation-core message-to-tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The hector_localization stack is a collection of packages, that provide the full 6DOF pose of a robot or platform.
    It uses various sensor sources, which are fused using an Extended Kalman filter.

    Acceleration and angular rates from an inertial measurement unit (IMU) serve as primary measurements.
    The usage of other sensors is application-dependent. The hector_localization stack currently supports
    GPS, magnetometer, barometric pressure sensors and other external sources that provide a geometry_msgs/PoseWithCovariance
    message via the poseupdate topic.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
