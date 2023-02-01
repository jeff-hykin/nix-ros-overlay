
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, geometry-msgs, libyamlcpp, roscpp, sensor-msgs, std-srvs, trajectory-msgs }:
buildRosPackage {
  pname = "ros-melodic-dynamixel-workbench-operators";
  version = "2.2.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dynamixel-workbench-release";
    rev = "ae56741a4e334885aba3757521e7deeebf19dc7f";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-ZhdTeSc1rQZgLZSpzPGjGz6Q/EuqHhe5dWZY462X6MM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cmake-modules geometry-msgs libyamlcpp roscpp sensor-msgs std-srvs trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains nodes that control the Dynamixel by communicating with the server registered in the 'dynamixel_workbench_controllers' package'';
    license = with lib.licenses; [ asl20 ];
  };
}
