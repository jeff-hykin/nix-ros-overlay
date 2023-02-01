
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-lint-auto, ament-lint-common, irobot-create-description, robot-state-publisher, urdf }:
buildRosPackage {
  pname = "ros-galactic-turtlebot4-description";
  version = "0.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot4-release";
    rev = "628766bdef3046f26d03f6e476e84a51c8138141";
    owner = "ros2-gbp";
    sha256 = "sha256-qU0/0wiyHvy87AfnAm6TA5SQCANkk65DEsU3CmlB9Xs=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ irobot-create-description robot-state-publisher urdf ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Turtlebot4 Description package'';
    license = with lib.licenses; [ asl20 ];
  };
}
