
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core }:
buildRosPackage {
  pname = "ros-foxy-test-interface-files";
  version = "0.8.1-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "ros2-gbp";
        repo = "test_interface_files-release";
        rev = "release/foxy/test_interface_files/0.8.1-1";
        sha256 = "sha256-1LaOTUZ0PRrPCOWKAJIUsZPXslHoaCv/erPnexXKhAI=";
      };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-core ];
  nativeBuildInputs = [ ament-cmake-core ];

  meta = {
    description = ''A package containing message definitions and fixtures used exclusively for testing purposes.'';
    license = with lib.licenses; [ asl20 ];
  };
}
