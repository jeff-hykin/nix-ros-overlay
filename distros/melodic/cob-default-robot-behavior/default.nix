
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-light, cob-script-server, pythonPackages, rospy, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-melodic-cob-default-robot-behavior";
  version = "0.7.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_robots-release";
    rev = "8d954b1cf2d89f684f476a468ad0c58a7afa3b04";
    owner = "ipa320";
    sha256 = "sha256-ZKbjFcNfRU/ETZHybU0DJICtdQ/IVoPEx9WVJtOUDvo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin pythonPackages.setuptools ];
  propagatedBuildInputs = [ cob-light cob-script-server rospy std-msgs std-srvs ];
  nativeBuildInputs = [ catkin pythonPackages.setuptools ];

  meta = {
    description = ''The cob_default_robot_behavior package provides helper scripts for standard robot behaviors.'';
    license = with lib.licenses; [ asl20 ];
  };
}
