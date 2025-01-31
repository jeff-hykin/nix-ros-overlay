
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pcl-ros, quanergy-client, roscpp, sensor-msgs }:
buildRosPackage {
  pname = "ros-melodic-quanergy-client-ros";
  version = "4.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "quanergy_client_ros-release";
    rev = "f5c7921cd1ba0e8267ffe00a875812f127baf497";
    owner = "QuanergySystems";
    sha256 = "sha256-PWFYfKcMTOwDw7g5rHruzrBcX5EFJEsNr5zD+x2IisU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ pcl-ros quanergy-client roscpp sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The quanergy_client_ros package provides a ROS driver for Quanergy sensors'';
    license = with lib.licenses; [ mit ];
  };
}
