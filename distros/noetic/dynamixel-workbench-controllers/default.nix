
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, dynamixel-workbench-msgs, dynamixel-workbench-toolbox, eigen, geometry-msgs, libyamlcpp, roscpp, sensor-msgs, trajectory-msgs }:
buildRosPackage {
  pname = "ros-noetic-dynamixel-workbench-controllers";
  version = "2.2.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "dynamixel-workbench-release";
    rev = "b8e161cafae934ca44e96c65a4c5a32900188265";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-wvyMaEAMuAzhi7Wcbhx9ikalj8HCofwBZ5J8lYZU4Rk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cmake-modules dynamixel-workbench-msgs dynamixel-workbench-toolbox eigen geometry-msgs libyamlcpp roscpp sensor-msgs trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains examples of applying the 'dynamixel_workbench_toolbox' library developed on the basis of dynamixel_sdk to various operating modes of Dynamixel.'';
    license = with lib.licenses; [ asl20 ];
  };
}
