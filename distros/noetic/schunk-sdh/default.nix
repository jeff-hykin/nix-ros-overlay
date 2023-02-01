
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, boost, catkin, cob-srvs, control-msgs, diagnostic-msgs, dpkg, libntcan, libpcan, libusb1, message-generation, message-runtime, roscpp, roslint, sdhlibrary-cpp, sensor-msgs, std-msgs, std-srvs, trajectory-msgs, urdf }:
buildRosPackage {
  pname = "ros-noetic-schunk-sdh";
  version = "0.6.14-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "schunk_modular_robotics-release";
    rev = "9001235f9af03fb3213f02c7f14fbe7b7dae5c42";
    owner = "ipa320";
    sha256 = "sha256-8nQDbkqJKaA7ggj7AOw/fUX/uxHwbwve34BoP5yyZdc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation roslint ];
  propagatedBuildInputs = [ actionlib boost cob-srvs control-msgs diagnostic-msgs dpkg libntcan libpcan libusb1 message-runtime roscpp sdhlibrary-cpp sensor-msgs std-msgs std-srvs trajectory-msgs urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides an interface for operating the schunk dexterous hand (SDH), including the tactile sensors.'';
    license = with lib.licenses; [ asl20 ];
  };
}
