
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-uuv-gazebo-ros-plugins-msgs";
  version = "0.6.13";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "uuv_simulator-release";
    rev = "2033997d03babe0357ec34d10d54c5806a9a0921";
    owner = "uuvsimulator";
    sha256 = "sha256-n1QczTZhmEnwxXAg823BPpj9jnJMTYNcH2QjssoePOo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The uuv_gazebo_ros_plugins_msgs package'';
    license = with lib.licenses; [ asl20 ];
  };
}
