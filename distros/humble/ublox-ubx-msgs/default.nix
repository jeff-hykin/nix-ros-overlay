
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, builtin-interfaces, rosidl-default-generators, std-msgs }:
buildRosPackage {
  pname = "ros-humble-ublox-ubx-msgs";
  version = "0.3.5-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ublox_dgnss-release";
    rev = "b80f5792511b321da5e44704c1d3ab7925fd5555";
    owner = "aussierobots";
    sha256 = "sha256-rPeG/k/7UAr25C9ghUPya7+ZwS9svz66lkGJCDlEi6w=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''UBLOX UBX ROS2 Msgs'';
    license = with lib.licenses; [ asl20 ];
  };
}
