
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-autoware-can-msgs";
  version = "1.14.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "messages-release";
    rev = "ed564ce68a82ccbf0d42d5c8506585ba9a1d7b76";
    owner = "autoware-ai";
    sha256 = "sha256-cYR5wQOEsFuNLRn5Lo9gFdPZCkE/sM0MM/Eh0sD/tXk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The autoware_can_msgs package'';
    license = with lib.licenses; [ asl20 ];
  };
}
