
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-common, rosidl-default-generators, rosidl-default-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-humble-rc-common-msgs";
  version = "0.5.3-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rc_common_msgs_ros2-release";
    rev = "9faa4c8a220dd6f9c8c7c68c1f2b5ae905139f51";
    owner = "ros2-gbp";
    sha256 = "sha256-/ApqcAoxtUu0eHcF5gxxFhroOIdz457iCAONfAC2xxQ=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-common ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''Common msg and srv definitions used by Roboception's ROS2 packages'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
