
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, freetype, git, libGL, libGLU, pkg-config, xorg }:
buildRosPackage {
  pname = "ros-foxy-rviz-ogre-vendor";
  version = "8.2.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rviz-release";
    rev = "6e3344e875ddad926ca1c16b2c375032db301706";
    owner = "ros2-gbp";
    sha256 = "sha256-LtK4JmDnLaFvTLjSufBUvrlB5BEjp+9jIFKvrU6Qq8U=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake git pkg-config ];
  propagatedBuildInputs = [ freetype libGL libGLU xorg.libX11 xorg.libXaw xorg.libXrandr ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Wrapper around ogre3d, it provides a fixed CMake module and an ExternalProject build of ogre.'';
    license = with lib.licenses; [ asl20 mit ];
  };
}
