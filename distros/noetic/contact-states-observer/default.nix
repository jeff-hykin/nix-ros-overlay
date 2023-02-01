
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, roseus, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-contact-states-observer";
  version = "0.1.16-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_control-release";
    rev = "505cf8daecba08400319cf8181b28bbe7c51f86a";
    owner = "tork-a";
    sha256 = "sha256-U8za93qS+G9b+3u2FnsN9yvZ0ScYyL+wDZvnULweex0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ roseus std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The contact_states_observer package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
