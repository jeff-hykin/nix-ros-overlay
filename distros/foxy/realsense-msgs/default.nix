
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-common, rosidl-default-generators, rosidl-default-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-realsense-msgs";
  version = "2.0.8-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros2_intel_realsense-release";
    rev = "9e0f711b0acb8344fda0c0257e73bcda14a44cf7";
    owner = "ros2-gbp";
    sha256 = "sha256-31WTJs276O9cczmX1YoxCufWxOGqiEWUeCz+DIAZImY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-common ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''Message Definition for ROS2 RealSense Package'';
    license = with lib.licenses; [ asl20 ];
  };
}
