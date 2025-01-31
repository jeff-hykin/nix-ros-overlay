
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, laser-filters, nav-msgs, roslib, rospy, sensor-msgs, std-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-map-laser";
  version = "0.0.4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "laser_filtering_release";
    rev = "ee56da08dad2bee1725ccb4e8a4800b2d4e119ff";
    owner = "wu-robotics";
    sha256 = "sha256-KubzDze6BJooR49VMA6lY/0rgGywUeaKlXQPhyQB+7c=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ laser-filters nav-msgs roslib rospy sensor-msgs std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Filters a laser scan to remove points that are in the current static map'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
