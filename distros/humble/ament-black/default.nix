
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, python39Packages, pythonPackages }:
buildRosPackage {
  pname = "ros-humble-ament-black";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ament_black-release";
    rev = "7b5728471856000ba9319de99b43871ce592d319";
    owner = "Timple";
    sha256 = "sha256-NIMCiRWgwau4ngagdScX3/OvxtmMNZ8bJKLEoHpvkMg=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ python39Packages.unidiff pythonPackages.black ];

  meta = {
    description = ''The ability to check code against style conventions using
    black and generate xUnit test result files.'';
    license = with lib.licenses; [ asl20 ];
  };
}
