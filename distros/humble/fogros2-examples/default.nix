
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, fogros2, pythonPackages }:
buildRosPackage {
  pname = "ros-humble-fogros2-examples";
  version = "0.1.7-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fogros2-release";
    rev = "a1afb6b4adc434fc77a89b93e8fc98aac6c9a54b";
    owner = "ros2-gbp";
    sha256 = "sha256-Q88Rh23VRS6EUyEY8/Bjj9Ov9QZTCl3Hd5zEGY1uIUk=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ fogros2 ];

  meta = {
    description = ''Examples using FogROS2'';
    license = with lib.licenses; [ asl20 ];
  };
}
