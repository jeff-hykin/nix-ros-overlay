
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, message-generation, message-runtime, nav-2d-msgs }:
buildRosPackage {
  pname = "ros-melodic-locomotor-msgs";
  version = "0.3.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_navigation-release";
    rev = "dd630a3a62c09655eca50e6156daaac6691f22d6";
    owner = "DLu";
    sha256 = "sha256-zfJ3LoxvyYOLQe+QC9n6SZmCdtSrBiyuSHYioZDsEt8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs message-runtime nav-2d-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Action definition for Locomotor'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
