
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-khi-robot-msgs";
  version = "1.3.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "khi_robot-release";
    rev = "763b85946dcccef5cf0b93dc3f2c80482eac5858";
    owner = "Kawasaki-Robotics";
    sha256 = "sha256-9IoEYS7oAV78YOhN5bHWMFhl3KFZQM5auMTuMZJ0R84=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains KHI ROS robot msgs'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
