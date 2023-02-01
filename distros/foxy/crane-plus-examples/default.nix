
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, crane-plus-control, crane-plus-description, crane-plus-moveit-config, geometry-msgs, moveit-ros-planning-interface, rclcpp, tf2-geometry-msgs }:
buildRosPackage {
  pname = "ros-foxy-crane-plus-examples";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "crane_plus-release";
    rev = "b59cfc2a92ffce85e571cee82cb182f9b4f3c8a8";
    owner = "ros2-gbp";
    sha256 = "sha256-GR+YOvPWYcwf2AiEJuTC5dxxlcUTFRIKoST75rs28a0=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ crane-plus-control crane-plus-description crane-plus-moveit-config geometry-msgs moveit-ros-planning-interface rclcpp tf2-geometry-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''CRANE+ V2 examples package'';
    license = with lib.licenses; [ asl20 ];
  };
}
