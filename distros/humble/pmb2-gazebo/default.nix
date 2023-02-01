
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-auto, ament-lint-auto, ament-lint-common, gazebo-ros, gazebo-ros2-control, launch-pal, pal-gazebo-worlds, pmb2-2dnav, pmb2-bringup, pmb2-description }:
buildRosPackage {
  pname = "ros-humble-pmb2-gazebo";
  version = "4.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pmb2_simulation-release";
    rev = "63d04e47200bcf08dd1a451fb5a7f9cb19658c70";
    owner = "pal-gbp";
    sha256 = "sha256-6Ec/e6dY/KIVGx+FxfHXJ883FTevfVmn2dPW1/QQ/0A=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ gazebo-ros gazebo-ros2-control launch-pal pal-gazebo-worlds pmb2-2dnav pmb2-bringup pmb2-description ];
  nativeBuildInputs = [ ament-cmake-auto ];

  meta = {
    description = ''Simulation files for the PMB2 robot.'';
    license = with lib.licenses; [ asl20 ];
  };
}
