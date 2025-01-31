
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, roscpp, sensor-msgs, std-msgs, tf }:
buildRosPackage {
  pname = "ros-melodic-robot-one";
  version = "0.1.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot-one-ros-release";
    rev = "970e643d212b59e1c2b97c4d271bee4d4c0e27e9";
    owner = "AlexanderSilvaB";
    sha256 = "sha256-gZwiT4F/JzsV5GptmidK8jcWD0E3yAaM6E591ddQ1F0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime roscpp sensor-msgs std-msgs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package allows to use the Robot One Framework with ROS. The supported features of the framework includes the simulator and connection with the physical robots'';
    license = with lib.licenses; [ mit ];
  };
}
