
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cob-hardware-config, cob-moveit-config, joint-state-publisher, moveit-planners-ompl, moveit-plugins, moveit-ros-move-group, moveit-ros-perception, moveit-ros-visualization, moveit-setup-assistant, robot-state-publisher, rviz, tf, warehouse-ros }:
buildRosPackage {
  pname = "ros-noetic-cob-moveit-bringup";
  version = "0.7.8-r1";

  src = let
      fetchFromGithub = (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub;
    in
      fetchFromGithub {
        owner = "ipa320";
        repo = "cob_manipulation-release";
        rev = "release/noetic/cob_moveit_bringup/0.7.8-1";
        sha256 = "sha256-LyueyEvnkv462ora9DNMVZmWWfuOdwjH5GfY2HpPUkc=";
      };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cob-hardware-config cob-moveit-config joint-state-publisher moveit-planners-ompl moveit-plugins moveit-ros-move-group moveit-ros-perception moveit-ros-visualization moveit-setup-assistant robot-state-publisher rviz tf warehouse-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''MoveIt launch files'';
    license = with lib.licenses; [ asl20 ];
  };
}
