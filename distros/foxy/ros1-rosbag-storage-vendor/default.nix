
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, boost, bzip2, console-bridge, git, gpgme, openssl, pkg-config, pluginlib, ros1-bridge }:
buildRosPackage {
  pname = "ros-foxy-ros1-rosbag-storage-vendor";
  version = "0.0.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag2_bag_v2-release";
    rev = "a0d6c007e52c0a34b09402c8338b23795e5e207e";
    owner = "ros2-gbp";
    sha256 = "sha256-O/0sZt7sUPMGiJywvuNvsdw8Vcv5V5PGMcuF+0XmDk0=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake boost bzip2 console-bridge git gpgme openssl pkg-config pluginlib ros1-bridge ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  nativeBuildInputs = [ ament-cmake git ];

  meta = {
    description = ''Vendor package for rosbag_storage of ROS1'';
    license = with lib.licenses; [ asl20 ];
  };
}
