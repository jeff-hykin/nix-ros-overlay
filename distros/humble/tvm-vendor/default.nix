
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, git, libxml2, openblas, ros-environment, spirv-headers, spirv-tools, vulkan-loader }:
buildRosPackage {
  pname = "ros-humble-tvm-vendor";
  version = "0.9.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "tvm_vendor-release";
    rev = "6bc285f4cb652a9049e57dcefe0b4499a46a05f9";
    owner = "ros2-gbp";
    sha256 = "sha256-2Z0zp24HFwXUiu920M3BzA5aflzV2y78RFZk5tliNCc=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ros-environment ];
  propagatedBuildInputs = [ git libxml2 openblas spirv-headers spirv-tools vulkan-loader ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Wrapper around Apache TVM to make it available to the ROS ecosystem.'';
    license = with lib.licenses; [ asl20 ];
  };
}
