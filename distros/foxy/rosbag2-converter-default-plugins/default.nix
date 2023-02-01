
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gmock, ament-index-cpp, ament-lint-auto, ament-lint-common, pluginlib, rcpputils, rmw, rmw-fastrtps-cpp, rosbag2-cpp, rosbag2-test-common, rosidl-runtime-cpp, test-msgs }:
buildRosPackage {
  pname = "ros-foxy-rosbag2-converter-default-plugins";
  version = "0.3.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag2-release";
    rev = "2967a65c2b420fa30521d0bb6b67e899725fa297";
    owner = "ros2-gbp";
    sha256 = "sha256-eBbvXF8BitrZ1CUqKlK5sEA8wZmASP5L3HvgEmiGuuY=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rcpputils rmw-fastrtps-cpp rosbag2-cpp rosbag2-test-common test-msgs ];
  propagatedBuildInputs = [ ament-index-cpp pluginlib rcpputils rmw rmw-fastrtps-cpp rosbag2-cpp rosidl-runtime-cpp ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Package containing default plugins for format converters'';
    license = with lib.licenses; [ asl20 ];
  };
}
