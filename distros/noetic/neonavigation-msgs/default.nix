
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, costmap-cspace-msgs, map-organizer-msgs, planner-cspace-msgs, safety-limiter-msgs, trajectory-tracker-msgs }:
buildRosPackage {
  pname = "ros-noetic-neonavigation-msgs";
  version = "0.8.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "neonavigation_msgs-release";
    rev = "394a07447dcb1d8b88d395da9a7d32f807b7cc22";
    owner = "at-wat";
    sha256 = "sha256-IzhmRsAv+M3UuUv6r85eGECpJzIhbm9bZQ4vV5U6gl4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ costmap-cspace-msgs map-organizer-msgs planner-cspace-msgs safety-limiter-msgs trajectory-tracker-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Message definitions for neonavigation package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
