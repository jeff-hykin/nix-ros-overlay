
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-smacc-msgs";
  version = "1.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "smacc-release";
    rev = "fe9d0cbcb404e3c85b6a18bafdc63880b655ebed";
    owner = "robosoft-ai";
    sha256 = "sha256-2UJS3aNv94Mn/F9Hc/JqKkqzBe89qBGg2ADUj+YDeks=";
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
