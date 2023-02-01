
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, controller-manager, dsr-msgs2, hardware-interface, rclcpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-foxy-dsr-control2";
  version = "0.1.1-r4";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "doosan-robot2-release";
    rev = "807252d236702afa61e267592ef676b0a063ef69";
    owner = "doosan-robotics";
    sha256 = "sha256-hNRTTW+rav+6+tS8petYQLRy7qI+oa/SA77HC9sgjNY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager dsr-msgs2 hardware-interface rclcpp sensor-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''The dsr_control2 package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
