
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-cmake-pytest, ament-lint-auto, ament-lint-common, launch, launch-ros, launch-testing, nav2-common, navigation2, slam-toolbox }:
buildRosPackage {
  pname = "ros-foxy-nav2-bringup";
  version = "0.4.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation2-release";
    rev = "1932429f644ee4c72f7a0458c92ecce2a9996222";
    owner = "SteveMacenski";
    sha256 = "sha256-6NyKhwnPAYprcIcoCeLj/1LURNXPvohga2fwmjgQNjE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ];
  propagatedBuildInputs = [ launch-ros nav2-common navigation2 slam-toolbox ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Bringup scripts and configurations for the navigation2 stack'';
    license = with lib.licenses; [ asl20 ];
  };
}
