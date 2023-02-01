
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake-modules, geometry-msgs, open-manipulator-msgs, open-manipulator-p-libs, robotis-manipulator, roscpp, sensor-msgs, std-msgs, trajectory-msgs }:
buildRosPackage {
  pname = "ros-melodic-open-manipulator-p-controller";
  version = "1.0.0-r5";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "open_manipulator_p-release";
    rev = "69f7ecae317ab89f3306221d5b56b20bd3e71c22";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-tUJXIzHLQ2IQPJZ8ZaRQDKxq9qkE7h/ZwZ8AH0x1uxo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost cmake-modules geometry-msgs open-manipulator-msgs open-manipulator-p-libs robotis-manipulator roscpp sensor-msgs std-msgs trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Package for OpenMANIPULATOR-P Controller'';
    license = with lib.licenses; [ asl20 ];
  };
}
