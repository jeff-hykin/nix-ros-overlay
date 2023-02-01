
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, robot-state-publisher, ros-ign }:
buildRosPackage {
  pname = "ros-foxy-crane-plus-ignition";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "crane_plus-release";
    rev = "985d3bced6d015070d95651f20a3a8046cd2fbe4";
    owner = "ros2-gbp";
    sha256 = "sha256-NsQBCY0994Whr7niYzIzJ8y2CazM+ahuFq7VOEoPzY4=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ robot-state-publisher ros-ign ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''CRANE+ V2 ignition gazebo simulation package'';
    license = with lib.licenses; [ asl20 ];
  };
}
