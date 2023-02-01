
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, diagnostic-msgs, diagnostic-updater, log4cxx, pr2-msgs, roscpp }:
buildRosPackage {
  pname = "ros-noetic-ocean-battery-driver";
  version = "1.1.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_power_drivers-release";
    rev = "aa6c0010c332eded9ab443a615904b4e2feb26c3";
    owner = "pr2-gbp";
    sha256 = "sha256-/IRMaNKq6Hg98vLz+6ABJcFeVqUY//kfSXCWY73Zl90=";
  };

  buildType = "catkin";
  buildInputs = [ boost catkin ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater log4cxx pr2-msgs roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This is an interface to the Ocean Server Technology Intelligent Battery and Power System.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
