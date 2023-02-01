
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, nav-msgs, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-map-msgs";
  version = "1.14.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_msgs-release";
    rev = "716ea374abd6411485369a26562ae3fbe60427b0";
    owner = "ros-gbp";
    sha256 = "sha256-7IurC6RLbfmueYraUPE0560XMCKFL7Ld61V9DfOD5eE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime nav-msgs sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package defines messages commonly used in mapping packages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
