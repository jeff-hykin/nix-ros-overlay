
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, gazebo-video-monitor-msgs, gazebo-video-monitor-plugins }:
buildRosPackage {
  pname = "ros-melodic-gazebo-video-monitors";
  version = "0.6.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "gazebo_video_monitors-release";
    rev = "1d1a001bc870cbbe0cde00ceafb641bf8820370a";
    owner = "nlamprian";
    sha256 = "sha256-ndjyL1W0JDkeER/fnRptbBxE9PEVVQvt2D4tM9aZYuE=";
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
