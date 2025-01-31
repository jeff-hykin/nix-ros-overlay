
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, libsForQt5, octomap, qt5 }:
buildRosPackage {
  pname = "ros-melodic-octovis";
  version = "1.9.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "octomap-release";
    rev = "818c2bd9e71d2ebdfcc29aab7763b87e03f9105a";
    owner = "ros-gbp";
    sha256 = "sha256-B3o5qIG2TXL7n4EG8EOfFE/k4yEj6kdYAtRPXbUfB6s=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ catkin libsForQt5.libqglviewer octomap qt5.qtbase ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''octovis is visualization tool for the OctoMap library based on Qt and libQGLViewer. See
  http://octomap.github.io for details.'';
    license = with lib.licenses; [ "GPL-2.0-only" ];
  };
}
