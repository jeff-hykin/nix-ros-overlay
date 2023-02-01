
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-ros }:
buildRosPackage {
  pname = "ros-melodic-mcmillan-airfield";
  version = "0.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uav_testing-release";
    rev = "5fda97fe0c69acb7675541fc9ab4e95b053a0132";
    owner = "ros-gbp";
    sha256 = "sha256-+XIW6ZifuYCFPO7De0jCZArqdRPAlYOCf3sZmtYjQnE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The mcmillan_airfield package'';
    license = with lib.licenses; [ asl20 ];
  };
}
