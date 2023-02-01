
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roslaunch, rospy }:
buildRosPackage {
  pname = "ros-melodic-timed-roslaunch";
  version = "0.1.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "timed_roslaunch-release";
    rev = "9ee80603817b7038ceb9db2a5ba97bb3b948fee6";
    owner = "MoriKen254";
    sha256 = "sha256-Htx5vTSxlnRyzkV6KJ8IOalIBPeNpG+F19gydUEWUqU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Script to delay the launch of a roslaunch file'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
