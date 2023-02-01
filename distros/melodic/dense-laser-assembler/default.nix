
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, calibration-msgs, catkin, roscpp, roscpp-serialization, sensor-msgs, settlerlib, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-dense-laser-assembler";
  version = "1.0.11-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_calibration-release";
    rev = "48fc865667c8293de1ab3904f9638099bfd8dcc1";
    owner = "UNR-RoboticsResearchLab";
    sha256 = "sha256-iOEfcBv0S4NAGJFf4UtLdT0uwbmUzShYkxYXRehQNFU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ calibration-msgs roscpp roscpp-serialization sensor-msgs settlerlib std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Stores streaming data from a laser sensor in a
    dense representation. This allows the user to do 'image-like'
    processing on the data, and can also be used for very fast approx
    neighborhood searches.  This package is still experimental and unstable.
    Expect its APIs to change.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
