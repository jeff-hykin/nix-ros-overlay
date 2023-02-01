
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, warthog-msgs, warthog-viz }:
buildRosPackage {
  pname = "ros-noetic-warthog-desktop";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "warthog_desktop-release";
    rev = "f234113636f0143165951dbd2cd79ef4cdbdcc02";
    owner = "clearpath-gbp";
    sha256 = "sha256-aajHMpN2BaXAgDcNV0Sfr5qRovXqZyZnY4wR2a9n4Nw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ warthog-msgs warthog-viz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Packages for working with Warthog from a ROS desktop.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
