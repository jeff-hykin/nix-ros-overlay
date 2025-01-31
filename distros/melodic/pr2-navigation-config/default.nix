
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, move-base }:
buildRosPackage {
  pname = "ros-melodic-pr2-navigation-config";
  version = "0.1.28-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_navigation-release";
    rev = "49d4a3574660eb07e48e9ee19a43cde2a22cde3a";
    owner = "pr2-gbp";
    sha256 = "sha256-675fisnDXUYznaZiHyva0pqIIPBRZV+JSXkIcpAl9xA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ move-base ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package holds common configuration files for running the'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
