
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-volta-msgs";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "volta-release";
    rev = "969f388d4d483078e62be1020cd63303562ba5a0";
    owner = "botsync-gbp";
    sha256 = "sha256-oTH7TNzWgeJeYwx3RRnL/gQoFWbTMVLyFIzZ81oKTtk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ message-generation std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The volta_msgs package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
