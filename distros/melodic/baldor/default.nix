
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pythonPackages }:
buildRosPackage {
  pname = "ros-melodic-baldor";
  version = "0.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "baldor-release";
    rev = "f2021150474281ea2485bb2b526665dac15d2737";
    owner = "crigroup";
    sha256 = "sha256-wMqIybt7BOmdKbRUhqPTUROXV8x6YqApIo38Wze15Ew=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pythonPackages.numpy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The baldor package'';
    license = with lib.licenses; [ bsd3 ];
  };
}
