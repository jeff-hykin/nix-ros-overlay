
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dingo-gazebo }:
buildRosPackage {
  pname = "ros-melodic-dingo-simulator";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dingo_simulator-release";
    rev = "d7fa31193c20405a7bbf19e4b6e452a2e2398ead";
    owner = "clearpath-gbp";
    sha256 = "sha256-9NyRnFXS1gBIkjm/KniByJ8VwPTiYOlSd6srsLkqtZk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dingo-gazebo ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Packages for simulating Dingo.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
