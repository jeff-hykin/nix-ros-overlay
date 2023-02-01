
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, uncrustify }:
buildRosPackage {
  pname = "ros-foxy-uncrustify-vendor";
  version = "1.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uncrustify_vendor-release";
    rev = "04f7bd47dc95d137f4ebafcd1a2fa22aad7d7d3c";
    owner = "ros2-gbp";
    sha256 = "sha256-h65qS/QImM9SV6H7bheuJxb5AH7gQOL4FoqXnvZ5yX8=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ uncrustify ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Wrapper around uncrustify, providing nothing but a dependency on uncrustify, on some systems.
    On others, it provides an ExternalProject build of uncrustify.'';
    license = with lib.licenses; [ asl20 "GPL-2.0-only" ];
  };
}
