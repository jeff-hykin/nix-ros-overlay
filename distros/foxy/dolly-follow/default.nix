
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, geometry-msgs, rclcpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-foxy-dolly-follow";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dolly-release";
    rev = "a44063a6e70a69b511f63056adeeb48eae634d5c";
    owner = "chapulina";
    sha256 = "sha256-BNzluvgNWZDMxx/Faj/iKoOMCZ/RJqllKFlqRwGzk/o=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ geometry-msgs rclcpp sensor-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Follow node for Dolly, the robot sheep.'';
    license = with lib.licenses; [ asl20 ];
  };
}
