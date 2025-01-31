
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-lint-auto, ament-lint-common, grid-map-cmake-helpers, grid-map-core, grid-map-msgs, grid-map-ros, libyamlcpp, pcl, rclcpp, rcutils }:
buildRosPackage {
  pname = "ros-humble-grid-map-pcl";
  version = "2.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "grid_map-release";
    rev = "eebe7f87183ae900ca424235b28714c6c0223f93";
    owner = "ros2-gbp";
    sha256 = "sha256-3bmXo+fjh7m96ZWDZm9cgjIdbiZvlwX5lA/itxg/hik=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake grid-map-cmake-helpers ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ grid-map-core grid-map-msgs grid-map-ros libyamlcpp pcl rclcpp rcutils ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Conversions between grid maps and Point Cloud Library (PCL) types.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
