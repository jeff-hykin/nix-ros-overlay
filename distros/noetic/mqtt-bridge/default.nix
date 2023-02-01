
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, python3Packages, rosbridge-library, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-mqtt-bridge";
  version = "0.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mqtt_bridge-release";
    rev = "0279e4aef09df8d774e08a964b6fb0bc831f9599";
    owner = "groove-x";
    sha256 = "sha256-Ra3UUsr6DjknDqRwIHNpW8d9HPNgn6vSr0ZOKjOnzzY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin python3Packages.pip python3Packages.setuptools ];
  propagatedBuildInputs = [ python3Packages.msgpack python3Packages.pymongo rosbridge-library rospy std-msgs ];
  nativeBuildInputs = [ catkin python3Packages.setuptools ];

  meta = {
    description = ''The mqtt_bridge package'';
    license = with lib.licenses; [ mit ];
  };
}
