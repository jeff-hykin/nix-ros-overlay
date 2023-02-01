
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-variant-msgs";
  version = "0.1.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "variant-release";
    rev = "92987134ea28b15f875856851c886f3e5ece3c14";
    owner = "anybotics";
    sha256 = "sha256-o1hU5/p2HzoYGy8ZR6skvbO7Qv7tRgQ5+X30RkVS4kw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Variant messages are designed to accommodate the information content of any invariant message. They are truly generic and can freely be converted to and from specific message objects.'';
    license = with lib.licenses; [ "GNU-Lesser-General-Public-License-LGPL-" ];
  };
}
