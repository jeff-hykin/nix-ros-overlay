
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-catch2, ament-cmake-uncrustify, boost, eigen, nlohmann-json-schema-validator-vendor, nlohmann_json, rclcpp, rmf-utils, websocketpp }:
buildRosPackage {
  pname = "ros-rolling-rmf-websocket";
  version = "2.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rmf_ros2-release";
    rev = "88c8e9fa22399da4d886ca9d9e4d3fa3eabad5fa";
    owner = "ros2-gbp";
    sha256 = "sha256-ryGSxKGS5CeRUUw9vuR9ehUBZy396JC8mTLmPjg8Er8=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake eigen ];
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  propagatedBuildInputs = [ boost nlohmann-json-schema-validator-vendor nlohmann_json rclcpp rmf-utils websocketpp ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''A package managing the websocket api endpoints in RMF system.'';
    license = with lib.licenses; [ asl20 ];
  };
}
