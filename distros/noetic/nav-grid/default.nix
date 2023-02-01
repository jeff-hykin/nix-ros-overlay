
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roslint, rosunit }:
buildRosPackage {
  pname = "ros-noetic-nav-grid";
  version = "0.3.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_navigation-release";
    rev = "2b7e23721755d5a14b5187bb305d13b93dc809dd";
    owner = "DLu";
    sha256 = "sha256-A5Q70LXKruvFOTTou+LfaVucCYO2EazGAw6HCfMijkQ=";
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
