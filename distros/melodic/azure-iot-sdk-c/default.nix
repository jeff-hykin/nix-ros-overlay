
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cmake, curl, openssl, util-linux }:
buildRosPackage {
  pname = "ros-melodic-azure-iot-sdk-c";
  version = "1.9.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "azure-iot-sdk-c-release";
    rev = "0113ea0c78d46dbf987e74a950ffdd2fd4697421";
    owner = "nobleo";
    sha256 = "sha256-d8dX0Z2z3vMQ/F+rB3jNFNJJhRnNpbP5jBgmBuQ/pBY=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ curl openssl util-linux ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Azure IoT C SDKs and Libraries'';
    license = with lib.licenses; [ mit ];
  };
}
