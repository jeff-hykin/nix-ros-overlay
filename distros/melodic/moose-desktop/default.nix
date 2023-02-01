
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, moose-msgs, moose-viz }:
buildRosPackage {
  pname = "ros-melodic-moose-desktop";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "moose_desktop-release";
    rev = "e1d0fb9ebc1352b1c7ee2ad01fa0c1c6fc04b6a3";
    owner = "clearpath-gbp";
    sha256 = "sha256-MBiVEFMpDrFpcCEdvYVDrUEGsAZu2jG+YVbvAjWf9rg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ moose-msgs moose-viz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Packages for working with Moose from a ROS desktop.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
