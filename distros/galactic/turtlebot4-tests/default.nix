
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, irobot-create-msgs, python3Packages, pythonPackages, sensor-msgs, std-msgs, turtlebot4-msgs }:
buildRosPackage {
  pname = "ros-galactic-turtlebot4-tests";
  version = "0.1.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot4_robot-release";
    rev = "e8d714d1f4bca7c4473e8db95b8aa4a1060a7949";
    owner = "ros2-gbp";
    sha256 = "sha256-dzZkrvzXla2YA/Xiggn94rThELbTnEg1IXwgpQOGtHA=";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 pythonPackages.pytest ];
  propagatedBuildInputs = [ irobot-create-msgs python3Packages.psutil sensor-msgs std-msgs turtlebot4-msgs ];

  meta = {
    description = ''Turtlebot4 System Tests'';
    license = with lib.licenses; [ asl20 ];
  };
}
