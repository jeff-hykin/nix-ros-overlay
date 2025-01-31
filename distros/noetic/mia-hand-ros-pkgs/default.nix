
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, mia-hand-bringup, mia-hand-description, mia-hand-driver, mia-hand-gazebo, mia-hand-moveit-config, mia-hand-msgs, mia-hand-ros-control }:
buildRosPackage {
  pname = "ros-noetic-mia-hand-ros-pkgs";
  version = "1.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mia_hand_ros_pkgs-release";
    rev = "388368ac6eaf800ade42281d1bf48b5acc25097a";
    owner = "Prensilia-srl";
    sha256 = "sha256-4OEkDHp6Ip4BYd6uGMrLvQ0fLe/qN17Wus/hEvvg+8o=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ mia-hand-bringup mia-hand-description mia-hand-driver mia-hand-gazebo mia-hand-moveit-config mia-hand-msgs mia-hand-ros-control ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS packages to use Mia Hand with ROS tools and ROS control.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
