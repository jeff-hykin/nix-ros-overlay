
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, teleop-twist-keyboard, tf2 }:
buildRosPackage {
  pname = "ros-melodic-mrpt-tutorials";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrpt_navigation-release";
    rev = "cf4146aa524e4bb6341d1eb2af88b37bdaf97b7a";
    owner = "mrpt-ros-pkg-release";
    sha256 = "sha256-aDAE+hDZ5XU1ELITVpiKAnXbhV+H9FWx3euVqFjfXVo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ teleop-twist-keyboard tf2 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Example files used as tutorials for MRPT ROS packages'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
