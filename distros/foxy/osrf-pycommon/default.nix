
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, python3Packages }:
buildRosPackage {
  pname = "ros-foxy-osrf-pycommon";
  version = "0.1.11-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "osrf_pycommon-release";
    rev = "c4331417b7f36f6ba624604a9e720b088d8b2493";
    owner = "ros2-gbp";
    sha256 = "sha256-5M7L7dhYvWXtpaEY90h1QezIqBDIkTqU733lQGhqtuI=";
  };

  buildType = "ament_python";
  propagatedBuildInputs = [ python3Packages.mock ];

  meta = {
    description = ''Commonly needed Python modules, used by Python software developed at OSRF.'';
    license = with lib.licenses; [ asl20 ];
  };
}
