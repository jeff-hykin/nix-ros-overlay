
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake-modules, geometry-msgs, moveit-core, moveit-msgs, moveit-ros-planning, moveit-ros-planning-interface, open-manipulator-libs, open-manipulator-msgs, robotis-manipulator, roscpp, sensor-msgs, std-msgs, trajectory-msgs }:
buildRosPackage {
  pname = "ros-melodic-open-manipulator-controller";
  version = "2.0.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "open_manipulator-release";
    rev = "5f2180cdca100d5b95e6f84c4947329bb3b6a556";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-UZWoPpJEoP1/oe4kuxU0p2z5d08+O8KjFDgc1p+mu3s=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ boost cmake-modules geometry-msgs moveit-core moveit-msgs moveit-ros-planning moveit-ros-planning-interface open-manipulator-libs open-manipulator-msgs robotis-manipulator roscpp sensor-msgs std-msgs trajectory-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''OpenManipulator controller package'';
    license = with lib.licenses; [ asl20 ];
  };
}
