
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-turtlebot3-msgs";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "turtlebot3_msgs-release";
    rev = "b6d789fd86f064f63b3cbd05021d3db6a3a74d07";
    owner = "ROBOTIS-GIT-release";
    sha256 = "sha256-TuKkhqY+h2teOgQsMu4wZ+onxN+V+kMDigJAUNrLiiw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Message and service types: custom messages and services for TurtleBot3 packages'';
    license = with lib.licenses; [ asl20 ];
  };
}
