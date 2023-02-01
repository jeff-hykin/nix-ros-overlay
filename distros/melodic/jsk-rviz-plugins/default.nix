
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, diagnostic-msgs, dynamic-reconfigure, geometry-msgs, image-geometry, image-publisher, jsk-footstep-msgs, jsk-gui-msgs, jsk-hark-msgs, jsk-recognition-msgs, jsk-recognition-utils, jsk-topic-tools, message-generation, mk, people-msgs, posedetection-msgs, pythonPackages, rosbuild, rviz, std-msgs, urdfdom-py, view-controller-msgs }:
buildRosPackage {
  pname = "ros-melodic-jsk-rviz-plugins";
  version = "2.1.7-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_visualization-release";
    rev = "6e74b01819e06e4ae8b0c42953e74a7e25a38635";
    owner = "tork-a";
    sha256 = "sha256-+UORHbiTU4LRWXAENANecpw39PAGBrQQbMe2PJYcxKs=";
  };

  buildType = "catkin";
  buildInputs = [ mk rosbuild ];
  propagatedBuildInputs = [ cv-bridge diagnostic-msgs dynamic-reconfigure geometry-msgs image-geometry image-publisher jsk-footstep-msgs jsk-gui-msgs jsk-hark-msgs jsk-recognition-msgs jsk-recognition-utils jsk-topic-tools message-generation people-msgs posedetection-msgs pythonPackages.scipy rviz std-msgs urdfdom-py view-controller-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The jsk_rviz_plugins package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
