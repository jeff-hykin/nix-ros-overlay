
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, actionlib-msgs, catkin, cv-bridge, image-cb-detector, message-filters, roscpp, settlerlib, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-laser-cb-detector";
  version = "0.10.14";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "calibration-release";
    rev = "eff3da8c384ec9accd2717cc84a9f6c7f801dd7f";
    owner = "ros-gbp";
    sha256 = "sha256-3NnQOLmxvBKEE2zKj5n1/ZjEhBoSzFnS6IQ29AOzaMg=";
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
