
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-clang-format, ament-cmake-gmock, ament-index-cpp, ament-lint-auto, ament-lint-common, mcap-vendor, pluginlib, rcpputils, rcutils, rosbag2-cpp, rosbag2-storage, rosbag2-storage-mcap-testdata, rosbag2-test-common, std-msgs }:
buildRosPackage {
  pname = "ros-foxy-rosbag2-storage-mcap";
  version = "0.6.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag2_storage_mcap-release";
    rev = "ae874012fbc1f235567303d252e5488bb3f81063";
    owner = "ros2-gbp";
    sha256 = "sha256-VRylbzLxzMfEKGv5N/rjaDEBiwDD7rv/kIIYgIpOTb4=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gmock ament-lint-auto ament-lint-common rcpputils rosbag2-cpp rosbag2-storage-mcap-testdata rosbag2-test-common std-msgs ];
  propagatedBuildInputs = [ ament-index-cpp mcap-vendor pluginlib rcutils rosbag2-storage ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''rosbag2 storage plugin using the MCAP file format'';
    license = with lib.licenses; [ asl20 ];
  };
}
