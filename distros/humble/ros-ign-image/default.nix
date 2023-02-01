
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-index-cpp, ros-gz-image }:
buildRosPackage {
  pname = "ros-humble-ros-ign-image";
  version = "0.244.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_ign-release";
    rev = "de466871c205269cb64d1ec290a36cd950806a02";
    owner = "ros2-gbp";
    sha256 = "sha256-1eCU7QzWM8Tqa3mkeT27uvLWLVWcAx5d6F8bbuR5Tik=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ament-index-cpp ];
  propagatedBuildInputs = [ ros-gz-image ];
  nativeBuildInputs = [ ament-cmake ament-index-cpp ];

  meta = {
    description = ''Shim package to redirect to ros_gz_image.'';
    license = with lib.licenses; [ asl20 ];
  };
}
