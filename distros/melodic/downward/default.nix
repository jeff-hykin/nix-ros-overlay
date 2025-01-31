
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, bison, cacert, catkin, flex, gawk, python, rostest, time }:
buildRosPackage {
  pname = "ros-melodic-downward";
  version = "2.1.24-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_3rdparty-release";
    rev = "77072444607c100076c85bebf1eb06bc45ebe070";
    owner = "tork-a";
    sha256 = "sha256-0pd/HaQl8Pk+vrsjE/wGK85KeLx843ZhmIb3GeocJQg=";
  };

  buildType = "catkin";
  buildInputs = [ bison cacert catkin flex python rostest ];
  propagatedBuildInputs = [ gawk time ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''fast downward: PDDL Planner (http://www.fast-downward.org)'';
    license = with lib.licenses; [ "GPL" ];
  };
}
