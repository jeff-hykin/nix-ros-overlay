
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, dynamic-reconfigure, geometry-msgs, image-publisher, image-transport, message-generation, message-runtime, nodelet, ros-pytest, roscpp, rostest, sensor-msgs, std-msgs, tf, tf2, tf2-geometry-msgs, tf2-ros, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-aruco-pose";
  version = "0.21.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "clover-release";
    rev = "7c3ec3e1eb1182dcc37cd9877b9f6651462cf28a";
    owner = "CopterExpress";
    sha256 = "sha256-YQna+5/hJHU8tefG6ZyHsvRdj8oWDD6mMbsZ/ISzWm0=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ image-publisher ros-pytest ];
  propagatedBuildInputs = [ cv-bridge dynamic-reconfigure geometry-msgs image-transport message-generation message-runtime nodelet roscpp rostest sensor-msgs std-msgs tf tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Positioning with ArUco markers'';
    license = with lib.licenses; [ mit ];
  };
}
