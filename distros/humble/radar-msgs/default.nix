
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, builtin-interfaces, geometry-msgs, rosidl-default-generators, std-msgs, unique-identifier-msgs }:
buildRosPackage {
  pname = "ros-humble-radar-msgs";
  version = "0.2.1-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "radar_msgs-release";
    rev = "78a5d5a75c9741da280e7ab42f412774e567e4a4";
    owner = "ros2-gbp";
    sha256 = "sha256-09etKgWuUL3tN+uERho/rQvfxovMzjJUK+2J9fg5Sa4=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators std-msgs unique-identifier-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Standard ROS messages for radars'';
    license = with lib.licenses; [ asl20 ];
  };
}
