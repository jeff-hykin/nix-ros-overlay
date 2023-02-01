
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, ar-track-alvar, ar-track-alvar-msgs, catkin, dynamic-reconfigure, geometry-msgs, roslint, rospy, std-msgs, tf, yocs-msgs }:
buildRosPackage {
  pname = "ros-melodic-yocs-localization-manager";
  version = "0.8.2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "yujin_ocs-release";
    rev = "edcc6f2cc97013aafae20fccc748e512077ee1bd";
    owner = "yujinrobot-release";
    sha256 = "sha256-AXeKsYM9pQKOHSOmYquCkVK9kmFw28HNmvXFN8bvBNk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint ];
  propagatedBuildInputs = [ actionlib ar-track-alvar ar-track-alvar-msgs dynamic-reconfigure geometry-msgs rospy std-msgs tf yocs-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Localization Manager helps to localize robot's position with annotated information'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
