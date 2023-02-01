
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cartographer-ros, catkin, husky-navigation, map-server, move-base, roslaunch, urdf, xacro }:
buildRosPackage {
  pname = "ros-melodic-husky-cartographer-navigation";
  version = "0.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "husky_cartographer_navigation-release";
    rev = "56b9ac4d15de9088ff9965a99406627538e0b7c3";
    owner = "clearpath-gbp";
    sha256 = "sha256-uiS2PHEQVmE/RF6ANQDdE/xoN3mBBvqAme+Dp6gdJAE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch ];
  propagatedBuildInputs = [ cartographer-ros husky-navigation map-server move-base urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch files and code for autonomous navigation of the Husky using Google Cartographer'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
