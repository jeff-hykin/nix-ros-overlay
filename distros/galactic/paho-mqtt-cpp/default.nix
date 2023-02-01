
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake, openssl, paho-mqtt-c }:
buildRosPackage {
  pname = "ros-galactic-paho-mqtt-cpp";
  version = "1.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "paho.mqtt.cpp-release";
    rev = "d16fe90730e854e4c0f5568dcb3f2d6f5a9181f9";
    owner = "nobleo";
    sha256 = "sha256-VFSBirqFHR5mGSkbm5dY7MhRMqy5U2N7A6EP/Qgr8H8=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ openssl paho-mqtt-c ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Eclipse Paho MQTT C++ Client Library'';
    license = with lib.licenses; [ "Eclipse-Public-License-v-1.0" ];
  };
}
