
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roscpp, roslib }:
buildRosPackage {
  pname = "ros-melodic-timestamp-tools";
  version = "1.6.8";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "driver_common-release";
    rev = "0e634d7903f92fe024b3cdc5a31161e1e4a59bce";
    owner = "ros-gbp";
    sha256 = "sha256-ReswhsaA1UeIac0A9zIxWkFvdzt7gsrpZqSPNrkn+G4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ roscpp roslib ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package is currently for internal use only. Its API may change
    without warning in the future.  This package is deprecated.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
