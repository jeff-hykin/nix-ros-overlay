
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, libyamlcpp, roscpp, visualization-msgs, yocs-msgs }:
buildRosPackage {
  pname = "ros-melodic-yocs-waypoint-provider";
  version = "0.8.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yujin_ocs-release";
    rev = "ed38300f613b6e9d0e0a93a3226474e3b762278f";
    owner = "yujinrobot-release";
    sha256 = "sha256-G/8Hp3t3IVWEEKOR+HUsBKTd2QPidJclidEG/TWYAC0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs libyamlcpp roscpp visualization-msgs yocs-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Parse a multiple poses from yaml and provide as topic and service. This package is highly inspired by yocs_waypoints_navi'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
