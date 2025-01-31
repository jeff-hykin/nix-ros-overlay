
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib-msgs, catkin, geometry-msgs, message-generation, message-runtime, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-pr2-common-action-msgs";
  version = "0.0.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_common_actions-release";
    rev = "74678c5cb3b91f2bbd5e7482692d9577eaaa8f2d";
    owner = "pr2-gbp";
    sha256 = "sha256-dhU+I0Hl4yQptNca8uXp9f8dv65zLh4vFATPvvWNuwQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ actionlib-msgs geometry-msgs message-runtime sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_common_action_msgs package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
