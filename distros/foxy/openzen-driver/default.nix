
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, launch, launch-testing, rclcpp, rqt-plot, sensor-msgs, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-foxy-openzen-driver";
  version = "1.2.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "openzen_sensor_ros2-release";
    rev = "82d6f0846507525cdfefbb4ddb8955da91c69ad7";
    owner = "lp-research";
    sha256 = "sha256-Uy8ICCnPmuP/oIlfhQhSlp2soLk/U4Bq+d7GFAMqqBo=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ launch launch-testing ];
  propagatedBuildInputs = [ rclcpp rqt-plot sensor-msgs std-msgs std-srvs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''ROS 2 Driver for LP-Research inertial measurement units and satellite navigation senors'';
    license = with lib.licenses; [ mit "BSL-1.0" lgpl3Only bsdOriginal ];
  };
}
