
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, ros-ign-bridge, ros-ign-gazebo, ros-ign-gazebo-demos, ros-ign-image }:
buildRosPackage {
  pname = "ros-rolling-ros-ign";
  version = "0.244.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_ign-release";
    rev = "68db186630e3c3031aaf81e8d281728023ac89a6";
    owner = "ros2-gbp";
    sha256 = "sha256-1HlJo5816Gidf4bD33hgKsxG/ioOCXFwUs/r2Ry+1mI=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ ros-ign-bridge ros-ign-gazebo ros-ign-gazebo-demos ros-ign-image ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Meta-package containing interfaces for using ROS 2 with <a href="https://ignitionrobotics.org">Ignition</a> simulation.'';
    license = with lib.licenses; [ asl20 ];
  };
}
