
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, builtin-interfaces, geographic-msgs, geometry-msgs, marti-common-msgs, rosidl-default-generators, rosidl-default-runtime, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-humble-marti-nav-msgs";
  version = "1.3.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "marti_messages-release";
    rev = "d49395e37c4b0ce424359acb1129aec69aa06adf";
    owner = "ros2-gbp";
    sha256 = "sha256-SRWOiuvZJ/2pvijdDbD+I9B7OU4xqgjXzYwIF2H5pPY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs marti-common-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''marti_nav_msgs'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
