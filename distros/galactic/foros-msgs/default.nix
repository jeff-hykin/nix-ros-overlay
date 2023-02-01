
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-common, builtin-interfaces, rosidl-default-generators, rosidl-default-runtime }:
buildRosPackage {
  pname = "ros-galactic-foros-msgs";
  version = "0.4.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "foros-release";
    rev = "6902ee448118b3a0dfa93f0b50b48bb1753a8883";
    owner = "ros2-gbp";
    sha256 = "sha256-2BfM+m3iK91wzWpNIBa4jXvgTI/2J8uCslc7wc8omzs=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-common ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];

  meta = {
    description = ''Fail over ROS messages (raft RPCs)'';
    license = with lib.licenses; [ asl20 ];
  };
}
