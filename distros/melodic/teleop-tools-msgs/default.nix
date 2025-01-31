
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, control-msgs, message-generation, message-runtime }:
buildRosPackage {
  pname = "ros-melodic-teleop-tools-msgs";
  version = "0.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "teleop_tools-release";
    rev = "3f8a0e67bcefcd4b07a6b9b9323dbcb99ad5a6a6";
    owner = "ros-gbp";
    sha256 = "sha256-R+1LEVlkEw8CwAm6gqS/etycEZLK4WgZneQHFBgBfbs=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs control-msgs message-runtime ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The teleop_tools_msgs package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
