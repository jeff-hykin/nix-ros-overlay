
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, pythonPackages, roslib, rospy, rosunit, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-rospy-message-converter";
  version = "0.5.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rospy_message_converter-release";
    rev = "0e29976041ce05f65e261c9d1e25f125723a022d";
    owner = "uos-gbp";
    sha256 = "sha256-/QmKoz7Y/DE3g/dz535r6vkFH/k92V6DebqapX0gqeU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  checkInputs = [ pythonPackages.numpy rosunit std-srvs ];
  propagatedBuildInputs = [ message-runtime roslib rospy std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Converts between Python dictionaries and JSON to rospy messages.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
