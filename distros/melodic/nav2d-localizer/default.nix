
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, nav-msgs, roscpp, sensor-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-nav2d-localizer";
  version = "0.4.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_2d-release";
    rev = "e732397b5a31e5d3aff19d949e0d103603ebdff5";
    owner = "skasperski";
    sha256 = "sha256-09z+xKbF8x7FGsyidxsJsx2brjXmfx/FaG4B6Hc7Vgw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs roscpp sensor-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Wrapper around Particle Filter implementation.
    The SelfLocalizer can be used as library or as a ros-node.'';
    license = with lib.licenses; [ gpl3Only ];
  };
}
