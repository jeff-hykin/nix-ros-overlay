
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, gazebo-ros, gazebo-ros-control, roscpp, std-msgs, urdf, xacro }:
buildRosPackage {
  pname = "ros-melodic-open-manipulator-gazebo";
  version = "1.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "open_manipulator_simulations-release";
    rev = "f31390bdcfb92df080694292c52df8b11852bd16";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-rwOrymK46Ji6k2Irn9aVq/poyNSXs0tq0qUEzFowsyo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ controller-manager gazebo-ros gazebo-ros-control roscpp std-msgs urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Gazebo configurations package for OpenManipulator'';
    license = with lib.licenses; [ asl20 ];
  };
}
