
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gmock, ament-cmake-gtest, ament-lint-common, foros-msgs, leveldb, rclcpp }:
buildRosPackage {
  pname = "ros-galactic-foros";
  version = "0.4.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "foros-release";
    rev = "eef7667eb71f9fe9b54962c96d6c97f25ca89213";
    owner = "ros2-gbp";
    sha256 = "sha256-8YWqhrgj1CxXj38a7HC76GeQnfb6SpyV6dsuhKvtZEk=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-common ];
  propagatedBuildInputs = [ foros-msgs leveldb rclcpp ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Fail Over ROS framework'';
    license = with lib.licenses; [ asl20 ];
  };
}
