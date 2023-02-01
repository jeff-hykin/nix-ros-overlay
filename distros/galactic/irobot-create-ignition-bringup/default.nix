
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-cppcheck, ament-cmake-cpplint, ament-cmake-flake8, ament-cmake-lint-cmake, ament-cmake-pep257, ament-cmake-uncrustify, ament-cmake-xmllint, ament-lint-auto, geometry-msgs, ign-ros2-control, irobot-create-common-bringup, irobot-create-description, irobot-create-ignition-plugins, irobot-create-ignition-toolbox, irobot-create-msgs, ros-ign-bridge, ros-ign-gazebo, ros-ign-interfaces, std-msgs }:
buildRosPackage {
  pname = "ros-galactic-irobot-create-ignition-bringup";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "create3_sim-release";
    rev = "4b848814571c995afe5b3be27a80a2d27b9a2b43";
    owner = "ros2-gbp";
    sha256 = "sha256-9JfhYSGABWIzscyX718My5EnNHgJR6rmolUIzSxJb9E=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  propagatedBuildInputs = [ geometry-msgs ign-ros2-control irobot-create-common-bringup irobot-create-description irobot-create-ignition-plugins irobot-create-ignition-toolbox irobot-create-msgs ros-ign-bridge ros-ign-gazebo ros-ign-interfaces std-msgs ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Provides launch and configuration scripts for a Ignition simulated iRobot(R) Create(R) 3 Educational Robot.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
