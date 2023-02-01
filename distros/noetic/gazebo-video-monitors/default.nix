
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-video-monitor-msgs, gazebo-video-monitor-plugins }:
buildRosPackage {
  pname = "ros-noetic-gazebo-video-monitors";
  version = "0.7.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gazebo_video_monitors-release";
    rev = "90dc42e8f58d932b418727be5ec022da38af7bba";
    owner = "nlamprian";
    sha256 = "sha256-ebSD+BLz4Z/jY1K01GbpULZQ3wNwP1X4AUii7q/IH1I=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ gazebo-video-monitor-msgs gazebo-video-monitor-plugins ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Metapackage that groups together the gazebo_video_monitors packages.'';
    license = with lib.licenses; [ gpl3Only ];
  };
}
