
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, geometry-msgs, message-filters, message-generation, message-runtime, roscpp, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-noetic-posedetection-msgs";
  version = "4.3.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_common_msgs-release";
    rev = "ef8988db6a637d747f0255bdea12c694803c8861";
    owner = "tork-a";
    sha256 = "sha256-IP8Qz4xflNECPu+ZxJCGQCamVQQVG3CqZmhokN+fIZ4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs message-filters message-runtime roscpp sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''posedetection_msgs provides messages and services to facilitate passing pose detection results and features.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
