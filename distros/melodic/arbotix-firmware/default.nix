
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-arbotix-firmware";
  version = "0.10.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "arbotix_ros-release";
    rev = "613ef2db85b11139c71f6ac07c509bab993df7b5";
    owner = "vanadiumlabs";
    sha256 = "sha256-hL6qjnmws9fWzuCeQM/SLHuBXmF9RdfDgl6JlKVq2/4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Firmware source code for ArbotiX ROS bindings.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
