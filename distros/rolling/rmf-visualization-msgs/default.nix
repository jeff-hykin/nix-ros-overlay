
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-common, builtin-interfaces, rosidl-default-generators, rosidl-default-runtime }:
buildRosPackage {
  pname = "ros-rolling-rmf-visualization-msgs";
  version = "1.2.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_visualization_msgs-release";
    rev = "54e63199bb2f0733bc0e5c4ba66a5140a055230c";
    owner = "ros2-gbp";
    sha256 = "sha256-f0qmm88R8ojtHtOAJxyMJRQyfj2ycFGIOQVZfRMWkyE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-common ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''A package containing messages used for visualizations'';
    license = with lib.licenses; [ asl20 ];
  };
}
