
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-gtest, ament-cmake-pytest, ament-cmake-python, ament-cmake-ros, ament-index-python, ament-lint-auto, ament-lint-common, fastcdr, fastrtps-cmake-module, osrf-testing-tools-cpp, performance-test-fixture, python3, rmw, rosidl-cli, rosidl-generator-c, rosidl-pycommon, rosidl-runtime-c, rosidl-runtime-cpp, rosidl-typesupport-fastrtps-cpp, rosidl-typesupport-interface }:
buildRosPackage {
  pname = "ros-rolling-rosidl-typesupport-fastrtps-c";
  version = "2.4.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosidl_typesupport_fastrtps-release";
    rev = "d39c579f9c9960b4fc6a1350a8a2a285367fa2a1";
    owner = "ros2-gbp";
    sha256 = "sha256-SOMFUA92OmRPAR/DULfNdyZOTuC3taMvQ6QDlPwdpj0=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-python ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common osrf-testing-tools-cpp performance-test-fixture ];
  propagatedBuildInputs = [ ament-cmake-ros ament-index-python fastcdr fastrtps-cmake-module python3 rmw rosidl-cli rosidl-generator-c rosidl-pycommon rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-fastrtps-cpp rosidl-typesupport-interface ];
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros fastrtps-cmake-module python3 rosidl-generator-c ];

  meta = {
    description = ''Generate the C interfaces for eProsima FastRTPS.'';
    license = with lib.licenses; [ asl20 ];
  };
}
