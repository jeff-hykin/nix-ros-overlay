
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, fmt, generate-parameter-library-py, parameter-traits, rclcpp, rclcpp-lifecycle, rsl, tcb-span, tl-expected }:
buildRosPackage {
  pname = "ros-rolling-generate-parameter-library";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "generate_parameter_library-release";
    rev = "f43dda8b84aa34d6be467dfae011a354634cc51b";
    owner = "PickNikRobotics";
    sha256 = "sha256-roGeZanzoZNM9V5/iae41ikNVpsMi924g9fPD48wflw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ fmt generate-parameter-library-py parameter-traits rclcpp rclcpp-lifecycle rsl tcb-span tl-expected ];
  nativeBuildInputs = [ ament-cmake generate-parameter-library-py ];

  meta = {
    description = ''CMake to generate ROS parameter library.'';
    license = with lib.licenses; [ bsd3 ];
  };
}
