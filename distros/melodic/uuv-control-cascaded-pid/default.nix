
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, geometry-msgs, nav-msgs, pythonPackages, rospy, tf }:
buildRosPackage {
  pname = "ros-melodic-uuv-control-cascaded-pid";
  version = "0.6.13";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uuv_simulator-release";
    rev = "f933cf0e2de8e4b3a65a1f0e9284d9cba1aa5324";
    owner = "uuvsimulator";
    sha256 = "sha256-2vottzrptT1d96JdKu5qsCwQrUD+acRvF8T31a6gdKY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure geometry-msgs nav-msgs pythonPackages.numpy rospy tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A cascade of PID controllers for acceleration, velocity, and position control.'';
    license = with lib.licenses; [ asl20 ];
  };
}
