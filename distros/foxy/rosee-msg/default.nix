
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, action-msgs, actionlib-msgs, ament-cmake, builtin-interfaces, example-interfaces, geometry-msgs, rosidl-default-generators, rosidl-default-runtime, std-srvs }:
buildRosPackage {
  pname = "ros-foxy-rosee-msg";
  version = "0.0.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosee2_msg-release";
    rev = "65fa946e7cc3ba48c40f2107f5b29dddd1e34e28";
    owner = "ADVRHumanoids";
    sha256 = "sha256-JYoSP63MW/TTdrLINU5lttEVthNCyi9AOlmEi9GApD4=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs actionlib-msgs builtin-interfaces example-interfaces geometry-msgs rosidl-default-runtime std-srvs ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''The rosee_msg package for ros2 version'';
    license = with lib.licenses; [ asl20 ];
  };
}
