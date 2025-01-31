
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, catkin, dynamic-tf-publisher, geometry-msgs, jsk-interactive-marker, mk, rosbuild, rospy, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-jsk-interactive";
  version = "2.1.8-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_visualization-release";
    rev = "28a340598632ddd072349e1281da83fbd23111e4";
    owner = "tork-a";
    sha256 = "sha256-C+M96eJuZZF6C9yX4tInILOfgUeuYbiQrDkG4U0nZBg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin mk rosbuild ];
  propagatedBuildInputs = [ actionlib dynamic-tf-publisher geometry-msgs jsk-interactive-marker rospy visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''jsk_interactive'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
