
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-pr2-msgs";
  version = "1.13.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_common-release";
    rev = "658971e633ad49f39dae59eec7e01b295c3db615";
    owner = "pr2-gbp";
    sha256 = "sha256-ODekMftIC3ysPKUfCCGksc/tAVyure2rCl86gJAZvKc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages for representing PR2 state, such as battery information and the PR2 fingertip sensors.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
