
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rm-common, roscpp, roslint }:
buildRosPackage {
  pname = "ros-noetic-rm-dbus";
  version = "0.1.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rm_control-release";
    rev = "d2d9cc2668b97e7ae9362b63f23c0712a27dc0bf";
    owner = "rm-controls";
    sha256 = "sha256-aHt0cFzAkg5bwLnSZW1Eky6/VgI20XGfWqs9Vs8OXk8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rm-common roscpp roslint ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A package that uses dbus to read remote control information'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
