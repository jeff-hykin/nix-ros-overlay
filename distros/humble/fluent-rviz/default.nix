
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, ament-lint-auto, geometry-msgs, ouxt-lint-common, rclcpp, std-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-humble-fluent-rviz";
  version = "0.0.3-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fluent_rviz-release";
    rev = "aef48e1063a9b33619c2d27537e626d287669544";
    owner = "ros2-gbp";
    sha256 = "sha256-/LmzIiGEHhv+jlon28dyJAjyB233kvyupBzUS01rdjA=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto ouxt-lint-common ];
  propagatedBuildInputs = [ geometry-msgs rclcpp std-msgs visualization-msgs ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''A library which makes Rviz fluent. Powered by C++17'';
    license = with lib.licenses; [ asl20 ];
  };
}
