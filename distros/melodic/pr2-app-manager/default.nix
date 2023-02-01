
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, app-manager, catkin, willow-maps }:
buildRosPackage {
  pname = "ros-melodic-pr2-app-manager";
  version = "0.6.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_apps-release";
    rev = "961ea5640677cf902dd47e45f2d7ab0a0f5d773e";
    owner = "pr2-gbp";
    sha256 = "sha256-EfQqym8J4tBRzcpbK4Jg99pwT2NwXUIHI/W0H7UblJU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ app-manager willow-maps ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Scripts and tools for running the application manager on the PR2.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
