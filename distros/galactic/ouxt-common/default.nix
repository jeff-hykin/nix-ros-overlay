
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ouxt-lint-common }:
buildRosPackage {
  pname = "ros-galactic-ouxt-common";
  version = "0.0.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ouxt_common-release";
    rev = "f62edf4e03b92af20b2b5ff02bde52e4fbd5f2a8";
    owner = "OUXT-Polaris";
    sha256 = "sha256-4nyGy7HVcpb5Cb/zBa9+kz8o7aXZyGqY2Fdy17Xd9ZY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ouxt-lint-common ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''common settings for OUXT Polaris ROS2 packages'';
    license = with lib.licenses; [ asl20 ];
  };
}
