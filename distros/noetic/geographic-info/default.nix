
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geodesy, geographic-msgs }:
buildRosPackage {
  pname = "ros-noetic-geographic-info";
  version = "0.5.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "geographic_info-release";
    rev = "3277535709aa3f33e945b3d4985d54020cdf76f7";
    owner = "ros-geographic-info";
    sha256 = "sha256-/VdTo/eyAglZJcxZa2Jpv5OQhJaQ2rSUncgTx0HcHJY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geodesy geographic-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Geographic information metapackage.

    Not needed for wet packages, use only to resolve dry stack
    dependencies.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
