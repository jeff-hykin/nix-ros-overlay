
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, angles, catkin, roscpp }:
buildRosPackage {
  pname = "ros-noetic-graceful-controller";
  version = "0.4.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "graceful_controller-gbp";
    rev = "273cbf64960c770429980c4d82b35ae4924dd2ca";
    owner = "mikeferguson";
    sha256 = "sha256-exxlqw+4aBd75Tp9vtNvqCs8P+97KEAMex94M8R1gzQ=";
  };

  buildType = "catkin";
  buildInputs = [ angles catkin ];
  propagatedBuildInputs = [ roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A controller.'';
    license = with lib.licenses; [ lgpl3Only ];
  };
}
