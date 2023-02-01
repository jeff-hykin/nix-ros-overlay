
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, qt5, radial-menu-model, radial-menu-msgs, roscpp, rviz }:
buildRosPackage {
  pname = "ros-melodic-radial-menu-rviz";
  version = "0.4.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "radial_menu_ros-release";
    rev = "7725b4055993df4f4e7fd51e41890f1cff4d60d9";
    owner = "yoshito-n-students";
    sha256 = "sha256-T7ObtnV4U4sId+8umaQWBsv+Y6rGbHfvMK4LemmIV4Y=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ qt5.qtbase radial-menu-model radial-menu-msgs roscpp rviz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The radial_menu_rviz package'';
    license = with lib.licenses; [ mit ];
  };
}
