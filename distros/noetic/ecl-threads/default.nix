
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-build, ecl-concepts, ecl-config, ecl-errors, ecl-exceptions, ecl-license, ecl-time, ecl-utilities }:
buildRosPackage {
  pname = "ros-noetic-ecl-threads";
  version = "0.62.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ecl_core-release";
    rev = "91fd148ff07ad0c6c2f38035d73ab5d2e86137be";
    owner = "yujinrobot-release";
    sha256 = "sha256-FkptCzZdD8z6lHaY0POzIzOCLsH2lpYM7JFCQUSQc0c=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ecl-build ecl-concepts ecl-config ecl-errors ecl-exceptions ecl-license ecl-time ecl-utilities ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides the c++ extensions for a variety of threaded 
     programming tools. These are usually different on different 
     platforms, so the architecture for a cross-platform framework
     is also implemented.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
