
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-ros, builtin-interfaces, rcl-interfaces, rosidl-default-generators, rosidl-default-runtime }:
buildRosPackage {
  pname = "ros-foxy-rosapi-msgs";
  version = "1.3.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbridge_suite-release";
    rev = "746ace9bbba21f8f11978b1479e84a2e3e143e6a";
    owner = "ros2-gbp";
    sha256 = "sha256-Q4dTs68oi8RWGF2fto9PtQNCnoH23yoHPnNZkMLJBRE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rcl-interfaces rosidl-default-runtime ];
  nativeBuildInputs = [ ament-cmake-ros rosidl-default-generators ];

  meta = {
    description = ''Provides service calls for getting ros meta-information, like list of
    topics, services, params, etc.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
