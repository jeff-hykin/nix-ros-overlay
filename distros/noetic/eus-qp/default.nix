
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, eigen, eus-qpoases, euslisp, rostest }:
buildRosPackage {
  pname = "ros-noetic-eus-qp";
  version = "0.1.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_control-release";
    rev = "2f870fca8dd98f4db592d3347a5b7537fc117399";
    owner = "tork-a";
    sha256 = "sha256-rkmWhz1+yp5vrD7NOzfB5KmIRD1HIv7MG2ZmKR6N3y8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules rostest ];
  checkInputs = [ eus-qpoases ];
  propagatedBuildInputs = [ eigen euslisp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''eus_qp is an interface of euslisp to solve qp problems with linear constraints.'';
    license = with lib.licenses; [ asl20 ];
  };
}
