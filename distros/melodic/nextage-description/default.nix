
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, urdf }:
buildRosPackage {
  pname = "ros-melodic-nextage-description";
  version = "0.8.6-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rtmros_nextage-release";
    rev = "cd47c252fb50af2f5e52ce503ad4cc22f8c7cb87";
    owner = "tork-a";
    sha256 = "sha256-0zAuSvnALA9A0XjrOu6pagJdwiKmu63XYqS6LT00FWw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''As a part of rtmros_nextage package that is a ROS interface for <a href="http://nextage.kawada.jp/en/">Nextage</a> dual-armed robot from Kawada Robotics Inc, this package provides its 3D model that can be used in simulation and <a href="http://ros.org/wiki/moveit">MoveIt!</a>-based motion planning tasks.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
