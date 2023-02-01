
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, cv-bridge, image-cb-detector, message-filters, roscpp, settlerlib, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-laser-cb-detector";
  version = "0.10.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "calibration-release";
    rev = "68d725c35c588a714be7f1c2901af677648ec22f";
    owner = "ros-gbp";
    sha256 = "sha256-5zhA0YPuHP+ODUlVQWJXmkLGzUZTsUWQAU9RfJ9gSPU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib actionlib-msgs cv-bridge image-cb-detector message-filters roscpp settlerlib std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Extracts checkerboard corners from a dense laser snapshot.
     This package is experimental and unstable. Expect its APIs to change.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
