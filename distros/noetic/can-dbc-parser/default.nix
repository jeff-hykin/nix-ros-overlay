
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, can-msgs, catkin, roscpp }:
buildRosPackage {
  pname = "ros-noetic-can-dbc-parser";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "raptor-dbw-ros-release";
    rev = "9e87a007c9189d3843f59b3cebc0ed06a2676866";
    owner = "nobleo";
    sha256 = "sha256-6BAZH71AnTRtkkW03VDGUQaGXXk2jKPOPTWzjr4DeJI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ can-msgs roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''DBC file interface.  Read a DBC file, unpack CAN messages and convert to engineering units, pack values into CAN messages for publishing.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
