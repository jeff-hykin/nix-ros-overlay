
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, fake-localization, gazebo-plugins, gazebo-ros, gazebo-ros-control, gundam-rx78-control, gundam-rx78-description, roslaunch, roslint, rostest }:
buildRosPackage {
  pname = "ros-melodic-gundam-rx78-gazebo";
  version = "0.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gundam_robot-release";
    rev = "a06ba3ce1053d02a8aee39a991ef3beb40570581";
    owner = "gundam-global-challenge";
    sha256 = "sha256-t9iuhkMsXnOATgGXkeFueS5VLn43thVpJLdjO2d+u3g=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch roslint rostest ];
  propagatedBuildInputs = [ fake-localization gazebo-plugins gazebo-ros gazebo-ros-control gundam-rx78-control gundam-rx78-description ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''gundam_rx78_gazebo contains launch scripts for simulating the GUNDAM RX-78 robot in the gazebo simulation'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
