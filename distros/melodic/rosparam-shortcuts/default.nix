
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, eigen, eigen-conversions, roscpp, roslint }:
buildRosPackage {
  pname = "ros-melodic-rosparam-shortcuts";
  version = "0.3.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosparam_shortcuts-release";
    rev = "ddc612bc05ad4074fc16dd5fa81dcca3ca0e1b12";
    owner = "PickNikRobotics";
    sha256 = "sha256-5XLWPuIIWqE+BqmEtwWcdtAiNlsiGb93STaUMg4KQsc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules eigen roslint ];
  propagatedBuildInputs = [ eigen-conversions roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Quickly load variables from rosparam with good command line error checking.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
