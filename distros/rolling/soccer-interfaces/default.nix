
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, soccer-vision-2d-msgs, soccer-vision-3d-msgs, soccer-vision-attribute-msgs }:
buildRosPackage {
  pname = "ros-rolling-soccer-interfaces";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "soccer_interfaces-release";
    rev = "3c677d11b98b86d3d194e5c9247f8318dde76cbb";
    owner = "ros2-gbp";
    sha256 = "sha256-vk/EmhgP6OQYIn59GYk85ZeW+QHa7gYOhl7TcQ9T4p4=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ soccer-vision-2d-msgs soccer-vision-3d-msgs soccer-vision-attribute-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Metapackage for soccer-related interfaces'';
    license = with lib.licenses; [ asl20 ];
  };
}
