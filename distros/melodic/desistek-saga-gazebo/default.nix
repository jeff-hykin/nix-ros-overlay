
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, desistek-saga-control, desistek-saga-description }:
buildRosPackage {
  pname = "ros-melodic-desistek-saga-gazebo";
  version = "0.3.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "desistek_saga-release";
    rev = "5745f9640525ed04303feda80cafe1e3dd935acc";
    owner = "uuvsimulator";
    sha256 = "sha256-Y6v5S5aXbkXqDWYUlBvZzl6A7cuZorWLey5jDq/D8ZI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ desistek-saga-control desistek-saga-description ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package with launch files for demonstrations with the Desistek SAGA ROV underwater vehicle'';
    license = with lib.licenses; [ asl20 ];
  };
}
