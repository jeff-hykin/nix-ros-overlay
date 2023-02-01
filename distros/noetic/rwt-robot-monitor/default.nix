
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-aggregator, diagnostic-msgs, rosbridge-server, rostest, roswww, rwt-plot, rwt-utils-3rdparty }:
buildRosPackage {
  pname = "ros-noetic-rwt-robot-monitor";
  version = "0.1.1-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "visualization_rwt-release";
    rev = "eddcb2b0e2ab8778e5ee7b0d58399a2ac76ff3f7";
    owner = "tork-a";
    sha256 = "sha256-xl0AxSjKUZXMad+NyE67gjp1XScSYoorn826yWpGBds=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ diagnostic-aggregator rostest ];
  propagatedBuildInputs = [ diagnostic-msgs rosbridge-server roswww rwt-plot rwt-utils-3rdparty ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The rwt_robot_monitor package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
