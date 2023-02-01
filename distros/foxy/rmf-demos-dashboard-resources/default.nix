
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake }:
buildRosPackage {
  pname = "ros-foxy-rmf-demos-dashboard-resources";
  version = "1.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_demos-release";
    rev = "1528d3eecae2ff419e0bf9ad988921bdd3c1d2e5";
    owner = "ros2-gbp";
    sha256 = "sha256-gK7S1gyr3IzZzjDYQTMuOHJCsEAOYhzuv7BcJN/p8nw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Resource pack for RMF dashboard'';
    license = with lib.licenses; [ asl20 ];
  };
}
