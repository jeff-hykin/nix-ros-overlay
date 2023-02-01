
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, control-msgs, controller-interface, controller-manager, dynamic-reconfigure, geometry-msgs, hardware-interface, nav-msgs, pluginlib, realtime-tools, rosgraph-msgs, rostest, rostopic, std-srvs, tf, urdf, xacro }:
buildRosPackage {
  pname = "ros-noetic-diff-drive-controller";
  version = "0.21.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ros_controllers-release";
    rev = "e662d85b598cafaec03c9fe3cd927f482b7a295d";
    owner = "ros-gbp";
    sha256 = "sha256-MsWpbtfxCrltF7drQ7Etxt2xl8cHoSco0s+QNpiSTP8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ controller-manager rosgraph-msgs rostest rostopic std-srvs xacro ];
  propagatedBuildInputs = [ boost control-msgs controller-interface dynamic-reconfigure geometry-msgs hardware-interface nav-msgs pluginlib realtime-tools tf urdf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Controller for a differential drive mobile base.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
