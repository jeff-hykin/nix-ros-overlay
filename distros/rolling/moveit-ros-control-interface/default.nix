
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, controller-manager-msgs, moveit-common, moveit-core, moveit-simple-controller-manager, pluginlib, rclcpp-action, trajectory-msgs }:
buildRosPackage {
  pname = "ros-rolling-moveit-ros-control-interface";
  version = "2.6.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "moveit2-release";
    rev = "089c80d37e006b59379503d4a5058591a665a8d3";
    owner = "moveit";
    sha256 = "sha256-DSEkdmzUrJ4IfnWx247QF8ko9yVcXxbCc15+VXV5D3k=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ controller-manager-msgs moveit-common moveit-core moveit-simple-controller-manager pluginlib rclcpp-action trajectory-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''ros_control controller manager interface for MoveIt'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
