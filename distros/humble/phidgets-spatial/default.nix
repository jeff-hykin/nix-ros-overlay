
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-ros, launch, phidgets-api, rclcpp, rclcpp-components, sensor-msgs, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-humble-phidgets-spatial";
  version = "2.3.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "phidgets_drivers-release";
    rev = "7aeabeb128cae8f28c5fe7efb5bfc90cadae6061";
    owner = "ros2-gbp";
    sha256 = "sha256-Kp1BaQKjpaOh8SZWo/h8mLTA4ZfYszHCYd0vY8xqtNI=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ launch phidgets-api rclcpp rclcpp-components sensor-msgs std-msgs std-srvs ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''Driver for the Phidgets Spatial 3/3/3 devices'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
