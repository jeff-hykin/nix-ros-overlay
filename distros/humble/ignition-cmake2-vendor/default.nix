
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-copyright, ament-cmake-lint-cmake, ament-cmake-test, ament-cmake-xmllint, cmake, doxygen, git, ignition }:
buildRosPackage {
  pname = "ros-humble-ignition-cmake2-vendor";
  version = "0.0.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ignition_cmake2_vendor-release";
    rev = "18bf27798d4be2ba4a85e9e9fb129681e4e7af2b";
    owner = "ros2-gbp";
    sha256 = "sha256-bZxidfrsqkCbbKbqdgbiC7SuwHBPMfR+/87ZeJpKzZY=";
  };

  buildType = "cmake";
  buildInputs = [ ament-cmake-test cmake doxygen git ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ];
  propagatedBuildInputs = [ ignition.cmake2 ];
  nativeBuildInputs = [ ament-cmake-test cmake doxygen git ];

  meta = {
    description = ''This package provides the Ignition CMake 2.x library.'';
    license = with lib.licenses; [ asl20 ];
  };
}
