
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, builtin-interfaces, rclcpp, rosidl-default-generators, rosidl-default-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-dsr-msgs2";
  version = "0.1.1-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "doosan-robot2-release";
    rev = "95c091e1cafe7d10222e6fde155c704f3d4d6408";
    owner = "doosan-robotics";
    sha256 = "sha256-tznDmnN1WfmAcqJYbPvmE/2RyR3kZfgv/xiXs0AqdDw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rclcpp rosidl-default-runtime std-msgs ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''The dsr_msgs2 package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
