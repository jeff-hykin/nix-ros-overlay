
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-updater, dynamic-reconfigure, message-generation, message-runtime, roscpp, self-test, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-driver-base";
  version = "1.6.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "driver_common-release";
    rev = "66b5fefe7113c0142fbdf83aaa7b41533e6325eb";
    owner = "ros-gbp";
    sha256 = "sha256-lGb9f9ZY6WbT3ZmQD5je0LtN7nmxQSONRsEUdNoiaF0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ diagnostic-updater dynamic-reconfigure message-runtime roscpp self-test std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A framework for writing drivers that helps with runtime reconfiguration, diagnostics and self-test.

    This package is deprecated.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
