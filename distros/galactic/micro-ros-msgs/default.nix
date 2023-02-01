
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, rosidl-default-generators, rosidl-default-runtime }:
buildRosPackage {
  pname = "ros-galactic-micro-ros-msgs";
  version = "1.0.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "micro_ros_msgs-release";
    rev = "f02433eba29d5c484f48f8d2bfe119c50e1a2df8";
    owner = "ros2-gbp";
    sha256 = "sha256-kuDv7e3C0BCXolx6ePv0TLEpK9E3OfLGFAh0K/9Wb8o=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Definitions for the ROS 2 msgs entities information used by micro-ROS to leverage its functionality to the same level as ROS 2, by means of a dedicated graph manager'';
    license = with lib.licenses; [ asl20 ];
  };
}
