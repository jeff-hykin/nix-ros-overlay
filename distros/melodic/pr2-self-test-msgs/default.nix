
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime }:
buildRosPackage {
  pname = "ros-melodic-pr2-self-test-msgs";
  version = "1.0.15-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_self_test-release";
    rev = "cd5ffa0de10003c07ff48e75fd7262c4ebe58f75";
    owner = "pr2-gbp";
    sha256 = "sha256-NdVcXF4v7qEuv/vIKPeIz9KmpBYNdP1zqfCblCekNOc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages used in PR2 hardware testing.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
