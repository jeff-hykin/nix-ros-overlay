
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, heron-msgs, heron-viz }:
buildRosPackage {
  pname = "ros-melodic-heron-desktop";
  version = "0.0.3-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "heron_desktop-release";
    rev = "21b3676816a794e6222dc03044eae65afbf33416";
    owner = "clearpath-gbp";
    sha256 = "sha256-BquXX2eUA1aOGFW2cIf7N5SBD1q6YoUGomEgBtecR3M=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ heron-msgs heron-viz ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The heron_desktop metapackage'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
