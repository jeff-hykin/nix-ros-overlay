
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, console-bridge, cpp-common, rosconsole }:
buildRosPackage {
  pname = "ros-melodic-rosconsole-bridge";
  version = "0.5.3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosconsole_bridge-release";
    rev = "adbf1aac01615669a5d2c4eef63bd874ebc5df58";
    owner = "ros-gbp";
    sha256 = "sha256-Fp4Axd/6P0pkKc7jw5+PC7fj0FTQHmzQgZqckkA7aD0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ console-bridge cpp-common rosconsole ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rosconsole_bridge is a package used in conjunction with console_bridge and rosconsole for connecting console_bridge-based logging to rosconsole-based logging.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
