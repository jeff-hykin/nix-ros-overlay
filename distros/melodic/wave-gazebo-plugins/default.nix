
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, gazebo-ros }:
buildRosPackage {
  pname = "ros-melodic-wave-gazebo-plugins";
  version = "1.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "vrx-release";
    rev = "67e57233307bd9cf705647a19c19ebc89d37f1d7";
    owner = "ros-gbp";
    sha256 = "sha256-eFdfocU6jv7OhvoOgYakU95Gw9gpIb/L3oSWSQ2sVaA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin eigen ];
  propagatedBuildInputs = [ gazebo-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains Gazebo plugins for the simulation of 
    water surface waves and hydrostatic and hydrodynamics forces.'';
    license = with lib.licenses; [ "TBD" ];
  };
}
