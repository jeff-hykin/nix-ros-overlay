
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-arbotix-msgs";
  version = "0.10.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "arbotix_ros-release";
    rev = "7d3fd77161409ffd733fd3268548cb0b4688102f";
    owner = "vanadiumlabs";
    sha256 = "sha256-bfIXo20LMggGb/xutXREtyw6hUDGuefDBjk2LTWAmi4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Messages and Services definitions for the ArbotiX.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
