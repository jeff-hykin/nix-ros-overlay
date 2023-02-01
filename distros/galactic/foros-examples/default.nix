
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-common, foros, rclcpp, std-msgs, std-srvs }:
buildRosPackage {
  pname = "ros-galactic-foros-examples";
  version = "0.4.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "foros-release";
    rev = "71ddfee30e1ff0661e26cd9c5934212a25645c52";
    owner = "ros2-gbp";
    sha256 = "sha256-wLenaUPYkbTfpUgwP8XyuWRNs7BK+w8XocDjCmIAEZo=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-common ];
  propagatedBuildInputs = [ foros rclcpp std-msgs std-srvs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Fail over ROS examples'';
    license = with lib.licenses; [ asl20 ];
  };
}
