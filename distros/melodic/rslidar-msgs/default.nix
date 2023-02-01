
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-rslidar-msgs";
  version = "1.0.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robosense-release";
    rev = "ae8a546a36e990664a236d7b097e7ffef6b17299";
    owner = "CPFL";
    sha256 = "sha256-bjeWQx5kkLPggbD3pm06aG/fm6jLhjUy/nhQiL23a1E=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS message definitions for Rslidar 3D LIDARs.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
