
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, microstrain-inertial-msgs, roscpp, roslint, rospy, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-microstrain-inertial-examples";
  version = "2.7.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "microstrain_inertial-release";
    rev = "c9698a212497c2e0284e6d6e73c09e126c0b6ee4";
    owner = "LORD-MicroStrain";
    sha256 = "sha256-D0WVPWD0UMpGV87wQOiRWHHX9i98FfWI3ZPj/WUqYjQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint ];
  propagatedBuildInputs = [ cmake-modules microstrain-inertial-msgs roscpp rospy sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Example listener for Parker LORD Sensing inertial device driver ros_mscl (C++).'';
    license = with lib.licenses; [ mit ];
  };
}
