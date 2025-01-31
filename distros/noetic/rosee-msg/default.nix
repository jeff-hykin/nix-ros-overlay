
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, geometry-msgs, message-generation, message-runtime, roscpp, rospy, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-noetic-rosee-msg";
  version = "1.0.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosee_msg-release";
    rev = "b9f985fa6d7e2bdb3103709dc24bd4c7148e8b3d";
    owner = "ADVRHumanoids";
    sha256 = "sha256-MiMLAVJ6lOeT0ntJritd6RydPoQLD70gNZt6UVZb/7U=";
  };

  buildType = "catkin";
  buildInputs = [ catkin geometry-msgs std-msgs std-srvs ];
  propagatedBuildInputs = [ actionlib-msgs message-generation message-runtime roscpp rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rosee_msg package'';
    license = with lib.licenses; [ asl20 ];
  };
}
