
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, rclcpp, rclcpp-components, std-msgs }:
buildRosPackage {
  pname = "ros-rolling-examples-rclcpp-minimal-composition";
  version = "0.16.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "examples-release";
    rev = "7586c71fe07097cc26bbf101e6227b42b8f69c41";
    owner = "ros2-gbp";
    sha256 = "sha256-XccZbx6YSi/SZLDRHvQ1yAO3tEEZ3ZzMGqX8hnRq1Jg=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ rclcpp rclcpp-components std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Minimalist examples of composing nodes in the same
  process'';
    license = with lib.licenses; [ asl20 ];
  };
}
