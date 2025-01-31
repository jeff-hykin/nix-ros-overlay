
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-pytest, ament-index-python, ament-lint-auto, ament-lint-common, rosidl-cli, rosidl-cmake }:
buildRosPackage {
  pname = "ros-humble-rosidl-generator-dds-idl";
  version = "0.8.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosidl_dds-release";
    rev = "36a89f4b5e5b9e1deee03da9cb80b7aa4763b644";
    owner = "ros2-gbp";
    sha256 = "sha256-UbHyVv/Xq0JbRDATE+abOq2ictJ0GXQ/mufIPF8i8A8=";
  };

  buildType = "ament_cmake";
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-cmake ];
  nativeBuildInputs = [ ament-cmake rosidl-cmake ];

  meta = {
    description = ''Generate the DDS interfaces for ROS interfaces.'';
    license = with lib.licenses; [ asl20 ];
  };
}
