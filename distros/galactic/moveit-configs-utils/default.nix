
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-index-python, ament-lint-auto, ament-lint-common, launch-param-builder }:
buildRosPackage {
  pname = "ros-galactic-moveit-configs-utils";
  version = "2.3.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "moveit2-release";
    rev = "85bc6d49552628bd6d60e714b43470c0776beb0c";
    owner = "moveit";
    sha256 = "sha256-IJj4TuhC3EBPrPGo4JgXa6hMkEJ022UOlxXcd6bq5AM=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ ament-index-python launch-param-builder ];

  meta = {
    description = ''Python library for loading moveit config parameters in launch files'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
