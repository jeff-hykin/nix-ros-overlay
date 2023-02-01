
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, libyamlcpp, map-server, nav-core2, nav-msgs, pluginlib, roscpp, roslint }:
buildRosPackage {
  pname = "ros-noetic-global-planner-tests";
  version = "0.3.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "robot_navigation-release";
    rev = "2b3fb4fcbf05f5f194cf6730873cecabc70c1518";
    owner = "DLu";
    sha256 = "sha256-bu8nN916bT4jt2TZVoILR2c/qG4MLmKv99f/7ClgbzI=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslint ];
  propagatedBuildInputs = [ libyamlcpp map-server nav-core2 nav-msgs pluginlib roscpp ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A collection of tests for checking the validity and completeness of global planners.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
