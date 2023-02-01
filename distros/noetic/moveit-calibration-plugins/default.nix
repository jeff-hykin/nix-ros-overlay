
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, baldor, catkin, criutils, eigen, handeye, jsoncpp, pluginlib, rosconsole, roscpp, rosunit, sensor-msgs, tf2, tf2-eigen, tf2-geometry-msgs }:
buildRosPackage {
  pname = "ros-noetic-moveit-calibration-plugins";
  version = "0.1.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "moveit_calibration-release";
    rev = "53e36183a2cb7fcea73257c51d22e24f7d159800";
    owner = "JStech";
    sha256 = "sha256-nIC1LxgXook6P52XMEWQ3f37MkRLJKmBBHuFFeIsqQM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin eigen ];
  checkInputs = [ rosunit ];
  propagatedBuildInputs = [ baldor criutils handeye jsoncpp pluginlib rosconsole roscpp sensor-msgs tf2 tf2-eigen tf2-geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Plugins of MoveIt calibration'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
