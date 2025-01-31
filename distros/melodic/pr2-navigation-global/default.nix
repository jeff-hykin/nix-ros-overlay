
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, amcl, catkin, joint-trajectory-generator, move-base, pr2-machine, pr2-move-base, pr2-navigation-config, pr2-tuck-arms-action, topic-tools }:
buildRosPackage {
  pname = "ros-melodic-pr2-navigation-global";
  version = "0.1.28-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_navigation-release";
    rev = "7ad7b2156eef33e2c778307ef0fc8d501cf3bc57";
    owner = "pr2-gbp";
    sha256 = "sha256-fVbi28JiPaKaci7j1QiLLZ2TlM3YqQ5QiJ3FmFMx4vg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ amcl joint-trajectory-generator move-base pr2-machine pr2-move-base pr2-navigation-config pr2-tuck-arms-action topic-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package holds XML files for running the'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
