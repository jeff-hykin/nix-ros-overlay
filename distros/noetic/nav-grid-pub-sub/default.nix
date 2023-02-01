
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, map-msgs, nav-2d-msgs, nav-2d-utils, nav-core2, nav-grid, nav-grid-iterators, nav-msgs, roscpp, roslint }:
buildRosPackage {
  pname = "ros-noetic-nav-grid-pub-sub";
  version = "0.3.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_navigation-release";
    rev = "0360dc10e2b940d98f70262f7cce026c4f3f6b01";
    owner = "DLu";
    sha256 = "sha256-hCGpOEFTLJFyH2qek/Jb3NVnYRR7C8/XKMBU7RzpXXo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint ];
  propagatedBuildInputs = [ geometry-msgs map-msgs nav-2d-msgs nav-2d-utils nav-core2 nav-grid nav-grid-iterators nav-msgs roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Publishers and Subscribers for nav_grid data.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
