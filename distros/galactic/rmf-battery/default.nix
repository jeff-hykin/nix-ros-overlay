
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-catch2, eigen, eigen3-cmake-module, rmf-cmake-uncrustify, rmf-traffic, rmf-utils }:
buildRosPackage {
  pname = "ros-galactic-rmf-battery";
  version = "0.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_battery-release";
    rev = "fd14d37106c728dc4e23cb783b345e501a688a3b";
    owner = "ros2-gbp";
    sha256 = "sha256-5PRiWzMAosMqe5ulTjecwrXDo5iHzpsnSTG2NQVKrVU=";
  };

  buildType = "cmake";
  buildInputs = [ eigen eigen3-cmake-module ];
  checkInputs = [ ament-cmake-catch2 rmf-cmake-uncrustify ];
  propagatedBuildInputs = [ rmf-traffic rmf-utils ];
  nativeBuildInputs = [ eigen3-cmake-module ];

  meta = {
    description = ''Package for modelling battery life of robots'';
    license = with lib.licenses; [ asl20 ];
  };
}
