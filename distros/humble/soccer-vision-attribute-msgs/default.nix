
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, rosidl-default-generators, rosidl-default-runtime }:
buildRosPackage {
  pname = "ros-humble-soccer-vision-attribute-msgs";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "soccer_interfaces-release";
    rev = "db7f8c2824d86cd51561fd76b6e2c0cf78be0c13";
    owner = "ros2-gbp";
    sha256 = "sha256-3YI3tO0R3y6nA1z66Tg0Eusoa9vpxWc2tpSRHAMoHfI=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''A package containing attributes of objects in 2d/3d vision in the soccer domain.'';
    license = with lib.licenses; [ asl20 ];
  };
}
