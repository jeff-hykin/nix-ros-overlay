
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-cppcheck, ament-cmake-cpplint, ament-cmake-flake8, ament-cmake-lint-cmake, ament-cmake-pep257, ament-cmake-uncrustify, ament-cmake-xmllint, ament-lint-auto, gazebo-dev, gazebo-ros, geometry-msgs, irobot-create-msgs, irobot-create-toolbox, rclcpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-galactic-irobot-create-gazebo-plugins";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "create3_sim-release";
    rev = "7461b9a7dd3f110ed3c5a9135e5bbb99130edc2b";
    owner = "ros2-gbp";
    sha256 = "sha256-2czTHC7ZzRRaNSyzBm22ZwTlqoT++2ZvKddpI1VgT60=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  propagatedBuildInputs = [ gazebo-dev gazebo-ros geometry-msgs irobot-create-msgs irobot-create-toolbox rclcpp sensor-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Provides the Gazebo plugins for the iRobot(R) Create(R) 3 Educational Robot.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
