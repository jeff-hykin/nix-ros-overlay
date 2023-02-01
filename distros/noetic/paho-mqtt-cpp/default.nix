
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake, openssl, paho-mqtt-c }:
buildRosPackage {
  pname = "ros-noetic-paho-mqtt-cpp";
  version = "1.2.0-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "paho.mqtt.cpp-release";
    rev = "ecd62b342d4c2824e1bfb5713cb9e3e0eb8b11c8";
    owner = "nobleo";
    sha256 = "sha256-7nKBYIUbhjZPof8iUxwD3XR2CfbAvREGpcdhb1m47eM=";
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
