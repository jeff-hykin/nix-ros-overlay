
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, example-interfaces, rclcpp, rosbag2-cpp, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-bag-recorder-nodes";
  version = "0.3.9-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag2-release";
    rev = "9d1e88657961c68f6e0f1adfbc75727dc5fae492";
    owner = "ros2-gbp";
    sha256 = "sha256-FrotGNLnAQUjwTZWoonuaqjOdXXJzQBVizC0pLrbg2o=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ example-interfaces rclcpp rosbag2-cpp std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Sample nodes demonstrating how to write bags programmatically'';
    license = with lib.licenses; [ asl20 ];
  };
}
