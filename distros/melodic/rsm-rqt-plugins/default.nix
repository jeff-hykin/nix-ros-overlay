
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, qt5, roscpp, rqt-gui, rqt-gui-cpp, rsm-msgs, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-rsm-rqt-plugins";
  version = "1.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_statemachine-release";
    rev = "2a933984104aff3f22b5e171fb907a67194f66f0";
    owner = "MarcoStb1993";
    sha256 = "sha256-7riSEPckluVRSDaGBivKtvZ7SNbHoJFx+pbkzkJ1w5g=";
  };

  buildType = "catkin";
  buildInputs = [ catkin qt5.qtbase ];
  propagatedBuildInputs = [ cmake-modules roscpp rqt-gui rqt-gui-cpp rsm-msgs std-msgs std-srvs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rsm_rqt_plugins package includes the Robot
		Statemachine GUI plugin for rqt'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
