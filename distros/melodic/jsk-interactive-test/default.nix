
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, jsk-interactive, jsk-interactive-marker, mk, rosbuild, rospy, rviz, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-jsk-interactive-test";
  version = "2.1.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_visualization-release";
    rev = "9c9baf3ec7bc0c0a7eb20ff4bb37930214ab0255";
    owner = "tork-a";
    sha256 = "sha256-TTsMi9XDN5YpqmHVT260wRbgrXgWd2QdxXhwI3qoanU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin mk rosbuild ];
  propagatedBuildInputs = [ jsk-interactive jsk-interactive-marker rospy rviz visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''jsk_interactive_test'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
