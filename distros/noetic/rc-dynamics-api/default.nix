
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, curl, protobuf }:
buildRosPackage {
  pname = "ros-noetic-rc-dynamics-api";
  version = "0.10.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rc_dynamics_api-release";
    rev = "ba885c0f260993b1d9bfff18b64f750e862b6904";
    owner = "roboception-gbp";
    sha256 = "sha256-CgF1DvmihZ7zEt6GzwvcAOi0VMx91Vuo6n2T89jcM5E=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ catkin curl protobuf ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''The rc_dynamics_api provides an API for easy handling of the dynamic-state data
      streams provided by Roboception's stereo camera with self-localization.
      See http://rc-visard.com

      Dynamic-state estimates of the rc_visard relate to its self-localization and
      ego-motion estimation. These states refer to rc_visard's current pose,
      velocity, or acceleration and are published on demand via several data streams.
      For a complete list and descriptions of these dynamics states and the
      respective data streams please refer to rc_visard's user manual.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
