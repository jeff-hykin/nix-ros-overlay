
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joint-state-publisher, python-qt-binding, rospy }:
buildRosPackage {
  pname = "ros-melodic-joint-state-publisher-gui";
  version = "1.12.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "joint_state_publisher-release";
    rev = "9e16c02fb974554e7859f93a7175f8730d6dd68e";
    owner = "ros-gbp";
    sha256 = "sha256-+O9tHLwqz64Sbqbk9Ctmp7nQ0Ygb7tlo6ZueED2hNDA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ joint-state-publisher python-qt-binding rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains a GUI tool for setting and publishing joint state values for a given URDF.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
