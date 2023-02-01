
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pythonPackages, rosbridge-library, rospy, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-mqtt-bridge";
  version = "0.1.8-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mqtt_bridge-release";
    rev = "20f39ea8c921887f559819d67c82ebd5994de235";
    owner = "groove-x";
    sha256 = "sha256-dO/22C/MA8HHWA5ia6zOCoickqtOyHBBvG7GoKOLnYk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pythonPackages.pip pythonPackages.setuptools ];
  propagatedBuildInputs = [ rosbridge-library rospy std-msgs ];
  nativeBuildInputs = [ catkin pythonPackages.setuptools ];

  meta = {
    description = ''The mqtt_bridge package'';
    license = with lib.licenses; [ mit ];
  };
}
