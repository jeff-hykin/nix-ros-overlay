
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, roscpp, roslint, rostest, rosunit }:
buildRosPackage {
  pname = "ros-noetic-boost-sml";
  version = "0.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "boost_sml-release";
    rev = "85cc0602b5c4ec041506b90047de5c1d61356690";
    owner = "PickNikRobotics";
    sha256 = "sha256-U5JdTzaA7FImbwM2qRa+mZT4NTqGb7cYCUNfiulQNQI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ rostest rosunit ];
  propagatedBuildInputs = [ boost roscpp roslint ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''State machine library with ros logging'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
