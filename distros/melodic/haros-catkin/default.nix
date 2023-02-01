
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, catkin-virtualenv, cccc, cppcheck }:
buildRosPackage {
  pname = "ros-melodic-haros-catkin";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "haros_catkin-release";
    rev = "e2dfc50c1e8f1f00207ca5fc74ceb5bed3c07046";
    owner = "rosin-project";
    sha256 = "sha256-ocjmh768L+OhM9Gj87YiLFCLBCswOwLBdTwLk9Ff4gg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin catkin-virtualenv ];
  propagatedBuildInputs = [ cccc cppcheck ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Catkin integration for HAROS (version 3.6.0)'';
    license = with lib.licenses; [ mit ];
  };
}
