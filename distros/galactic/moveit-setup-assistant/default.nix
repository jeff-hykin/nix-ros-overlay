
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-index-cpp, ament-lint-auto, ament-lint-common, libyamlcpp, moveit-common, moveit-core, moveit-resources-panda-moveit-config, moveit-ros-planning, moveit-ros-visualization, ogre1_9, ompl, rclcpp, srdfdom, urdf, xacro }:
buildRosPackage {
  pname = "ros-galactic-moveit-setup-assistant";
  version = "2.3.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "moveit2-release";
    rev = "241a2b3c20b3fdc25f8b256a2d5284031c47d4ec";
    owner = "moveit";
    sha256 = "sha256-HMxT3iAzHMqIRCdEn4RFHR98/Kv44BnQUCUY6aCQ/hs=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake moveit-common ogre1_9 ompl ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common moveit-resources-panda-moveit-config ];
  propagatedBuildInputs = [ ament-index-cpp libyamlcpp moveit-core moveit-ros-planning moveit-ros-visualization rclcpp srdfdom urdf xacro ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Generates a configuration package that makes it easy to use MoveIt'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
