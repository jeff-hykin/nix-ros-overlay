
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roslint, rosunit }:
buildRosPackage {
  pname = "ros-melodic-nav-grid";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_navigation-release";
    rev = "6562bc026534fbd42a64ac79ed45785352f94326";
    owner = "DLu";
    sha256 = "sha256-3uOUhLIiKk51eU8ocjXvAa1CEAASE9rO4EoJUNysFaw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint rosunit ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A templatized interface for overlaying a two dimensional grid on the world.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
