
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-gazebo-ros-control }:
buildRosPackage {
  pname = "ros-melodic-cob-gazebo-plugins";
  version = "0.7.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "cob_gazebo_plugins-release";
    rev = "3d6cd0fd582bc047e368d0e41aabcc01e0c31f02";
    owner = "ipa320";
    sha256 = "sha256-DmD6eeD2uw9AesG8JK8AOwYITEAbwcnt3U/ZM/BW05M=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-gazebo-ros-control ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''cob_gazebo_plugins meta-package'';
    license = with lib.licenses; [ asl20 ];
  };
}
