
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common }:
buildRosPackage {
  pname = "ros-foxy-clober-bringup";
  version = "0.2.0-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "clober_ros2-release";
    rev = "2d5be31eef49010ec9fd2a4ebc3f813ed9d080e0";
    owner = "CLOBOT-Co-Ltd-release";
    sha256 = "sha256-3UM9hAGGSYtCy0V0K+0Gxf/9hHo/XrwB/KTh0lzc9q8=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''clober bringup package'';
    license = with lib.licenses; [ asl20 ];
  };
}
