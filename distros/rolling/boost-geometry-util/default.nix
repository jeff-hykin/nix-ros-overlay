
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-auto, ament-lint-auto, boost, geometry-msgs, ouxt-common, rclcpp }:
buildRosPackage {
  pname = "ros-rolling-boost-geometry-util";
  version = "0.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "boost_geometry_util-release";
    rev = "2e3913f94aba9dea9a7764008314aad5648bcd12";
    owner = "OUXT-Polaris";
    sha256 = "sha256-5P2YMX4buwUYt7NAF7FiWJguryH/I8GC2y+vIK5KI0w=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ament-cmake-auto ];
  checkInputs = [ ament-lint-auto ouxt-common ];
  propagatedBuildInputs = [ boost geometry-msgs rclcpp ];
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ];

  meta = {
    description = ''Utility library for boost geometry'';
    license = with lib.licenses; [ asl20 ];
  };
}
