
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, action-msgs, ament-cmake-auto, ament-lint-auto, ament-lint-common, geometry-msgs, rosidl-default-generators, rosidl-default-runtime, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-galactic-autoware-auto-msgs";
  version = "1.0.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "autoware_auto_msgs-release";
    rev = "73ba4caec9851271151472433e06f37c44fd1e0e";
    owner = "ros2-gbp";
    sha256 = "sha256-sPwNe2uGjV3WHz+htqZrzm5dUO1JvGJC9xQcn2d+LU0=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ action-msgs geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''Interfaces between core Autoware.Auto components'';
    license = with lib.licenses; [ asl20 ];
  };
}
