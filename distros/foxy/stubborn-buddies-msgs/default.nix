
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, rosidl-default-generators, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-stubborn-buddies-msgs";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "stubborn_buddies-release";
    rev = "3114566b6d18133a045f97a6d06e9c166ae6e12a";
    owner = "ros2-gbp";
    sha256 = "sha256-ca+tBYzurY7xkoSry24RR8HaTLuuHAEKuBOxT57QSXY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Messages to support library of stubborn buddies'';
    license = with lib.licenses; [ asl20 ];
  };
}
