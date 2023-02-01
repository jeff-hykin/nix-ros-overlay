
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, amcl, catkin, dwa-local-planner, global-planner, gmapping, map-server, move-base }:
buildRosPackage {
  pname = "ros-melodic-copernicus-navigation";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "copernicus-release";
    rev = "09b1bf169f4af6a3fe7fef95e432e9b471e8c9c1";
    owner = "botsync-gbp";
    sha256 = "sha256-qOVq37k/4hI35J1mo2Vk3y/wnC675gkMXcDbVemUSoI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ amcl dwa-local-planner global-planner gmapping map-server move-base ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The copernicus_navigation package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
