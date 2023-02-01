
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-ros, ament-lint-auto, ament-lint-common, rmw-connextdds-common }:
buildRosPackage {
  pname = "ros-galactic-rmw-connextdds";
  version = "0.6.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmw_connextdds-release";
    rev = "8a76fdc4785e0d4f9b0b2588a524486fd6746029";
    owner = "ros2-gbp";
    sha256 = "sha256-fmhxty54nJYhY980xzJKVPzBPIEwYyRXVdQBcCk0fQ4=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ ament-cmake rmw-connextdds-common ];
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];

  meta = {
    description = ''A ROS2 RMW implementation built with RTI Connext DDS Professional.'';
    license = with lib.licenses; [ asl20 ];
  };
}
