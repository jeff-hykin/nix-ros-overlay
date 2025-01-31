
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, p2os-driver, p2os-msgs, p2os-teleop, p2os-urdf }:
buildRosPackage {
  pname = "ros-noetic-p2os-launch";
  version = "2.2.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "p2os-release";
    rev = "0fbd60f16f85df6a328f7b6fbefc2158dd3d9f87";
    owner = "allenh1";
    sha256 = "sha256-j4OeKtlaFXtmwGMDUNgsuvQNkWRW80YKMewzJDPJxGs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ p2os-driver p2os-msgs p2os-teleop p2os-urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Launch and config files designed for use with the p2os stack.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
