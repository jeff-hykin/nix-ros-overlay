
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, git, uncrustify }:
buildRosPackage {
  pname = "ros-galactic-uncrustify-vendor";
  version = "1.5.3-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uncrustify_vendor-release";
    rev = "f801a36ca9396e0ea5d15d08749b46cbc34cc7dc";
    owner = "ros2-gbp";
    sha256 = "sha256-XwwIWOr0xOyUUa/YgYB9Ifj/5VBrtzzsdxyNfXKbg4o=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake git ];
  propagatedBuildInputs = [ uncrustify ];
  nativeBuildInputs = [ ament-cmake git ];

  meta = {
    description = ''Wrapper around uncrustify, providing nothing but a dependency on uncrustify, on some systems.
    On others, it provides an ExternalProject build of uncrustify.'';
    license = with lib.licenses; [ asl20 "GPL-2.0-only" ];
  };
}
