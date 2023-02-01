
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-gtest, ament-cmake-ros, ament-lint-auto, ament-lint-common, pluginlib, sdformat, sdformat-test-files, tinyxml2-vendor, urdf, urdf-parser-plugin, urdfdom-headers }:
buildRosPackage {
  pname = "ros-galactic-sdformat-urdf";
  version = "0.1.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "sdformat_urdf-release";
    rev = "072766dd1d50307bc580203a402ceda91bfa73b5";
    owner = "ros2-gbp";
    sha256 = "sha256-lFZ1OuosM5YTmbHBLt+jRurzFbFxoBlolNTqLy+SLAw=";
  };

  buildType = "ament_cmake";
  buildInputs = [ pluginlib urdfdom-headers ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common sdformat-test-files ];
  propagatedBuildInputs = [ ament-cmake-ros sdformat tinyxml2-vendor urdf urdf-parser-plugin ];
  nativeBuildInputs = [ ament-cmake-ros ];

  meta = {
    description = ''URDF plugin to parse SDFormat XML into URDF C++ DOM objects.'';
    license = with lib.licenses; [ asl20 ];
  };
}
