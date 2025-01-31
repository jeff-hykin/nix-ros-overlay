
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, cv-bridge, gazebo, gazebo-plugins, gazebo-ros, geometry-msgs, glog, libyamlcpp, mav-msgs, mavros, octomap, octomap-msgs, octomap-ros, protobuf, rosbag, roscpp, rotors-comm, rotors-control, std-srvs, tf }:
buildRosPackage {
  pname = "ros-melodic-rotors-gazebo-plugins";
  version = "2.2.3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rotors_simulator-release";
    rev = "1eb266727977984dcee8959d113245ffe8778ba3";
    owner = "ethz-asl";
    sha256 = "sha256-eAN5O445B4sffZiSYMHswGy6xuR3QxA5tPH2qgj54fY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cmake-modules cv-bridge gazebo gazebo-plugins gazebo-ros geometry-msgs glog libyamlcpp mav-msgs mavros octomap octomap-msgs octomap-ros protobuf rosbag roscpp rotors-comm rotors-control std-srvs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rotors_gazebo_plugins package'';
    license = with lib.licenses; [ "ASL-2.0" ];
  };
}
