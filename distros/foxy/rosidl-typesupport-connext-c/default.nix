
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, connext-cmake-module, rcutils, rmw, rosidl-cmake, rosidl-generator-c, rosidl-generator-dds-idl, rosidl-parser, rosidl-runtime-c, rosidl-typesupport-connext-cpp }:
buildRosPackage {
  pname = "ros-foxy-rosidl-typesupport-connext-c";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosidl_typesupport_connext-release";
    rev = "57061c8a1de8b74e8cebd2083f12a21ad21a33d4";
    owner = "ros2-gbp";
    sha256 = "sha256-ONJZ6yzlJapK9NTw9Ej4/c/W3oYrAzGqKDXUaii74lU=";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ ament-cmake connext-cmake-module rcutils rmw rosidl-cmake rosidl-generator-c rosidl-generator-dds-idl rosidl-parser rosidl-runtime-c rosidl-typesupport-connext-cpp ];
  nativeBuildInputs = [ ament-cmake connext-cmake-module rcutils rosidl-cmake rosidl-generator-c rosidl-generator-dds-idl rosidl-runtime-c rosidl-typesupport-connext-cpp ];

  meta = {
    description = ''Generate the C interfaces for RTI Connext.'';
    license = with lib.licenses; [ asl20 ];
  };
}
