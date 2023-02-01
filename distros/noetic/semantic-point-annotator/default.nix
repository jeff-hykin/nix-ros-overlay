
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, eigen, pcl-ros, roscpp, tf }:
buildRosPackage {
  pname = "ros-noetic-semantic-point-annotator";
  version = "0.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_navigation-release";
    rev = "8c835f39f4087654f2a329b6e61d8145c3f1cec3";
    owner = "pr2-gbp";
    sha256 = "sha256-9+6GYoYZeL4ym1bXrqX4rQTnv4myh40cxiEmAE6escg=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ eigen pcl-ros roscpp tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A node which annotates 3D point cloud data with semantic labels.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
