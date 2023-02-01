
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, action-msgs, ament-cmake, ament-lint-common, builtin-interfaces, geometry-msgs, rosidl-default-generators, rosidl-default-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-galactic-irobot-create-msgs";
  version = "1.2.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "irobot_create_msgs-release";
    rev = "6517d82f97fd97ec030fdf3b5992bf6c205ff296";
    owner = "ros2-gbp";
    sha256 = "sha256-SJiYLX6ltDNJ0bFeyyXEOVtXBaJUFRHV0AbaQQd313Q=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-common ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''Package containing action, message, and service definitions used by the iRobot(R) Create(R) platform'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
