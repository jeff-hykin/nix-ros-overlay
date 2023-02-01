
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-safety-limiter-msgs";
  version = "0.8.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "neonavigation_msgs-release";
    rev = "ed2be0d32b9fa5c2e54d83726401db1455f6da08";
    owner = "at-wat";
    sha256 = "sha256-FwhAYFewZIWpYAHkmMUpeZ6D19yd2tm04ZxGzAVVW8M=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Message definitions for safety_limiter_msgs package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
