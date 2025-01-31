
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-marti-introspection-msgs";
  version = "0.11.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "marti_messages-release";
    rev = "015b6f77258b8d7f5fc9f2e8a215315c69176196";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-3OYAQY8YbYECRrHj3mZz9BbLZlFpac/75UO+P5tP910=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''marti_introspection_msgs'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
