
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-smacc-msgs";
  version = "0.9.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "smacc-release";
    rev = "7522ce173a8359cdf5aa679e30921c6076c8bf31";
    owner = "robosoft-ai";
    sha256 = "sha256-pEJajW0INB3m/slKx3L6wzbP3rOE1oSsyLTF6YxfAwU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''this package contains a set of messages that are used by the introspection
    interfaces for smacc.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
