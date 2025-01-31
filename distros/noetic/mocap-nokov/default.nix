
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, geometry-msgs, nav-msgs, roscpp, roslaunch, roslint, tf }:
buildRosPackage {
  pname = "ros-noetic-mocap-nokov";
  version = "0.0.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mocap_nokov_release";
    rev = "669fde1541a6612a69993aa554d0f78c2967e0d9";
    owner = "NOKOV-MOCAP";
    sha256 = "sha256-SYWnhkBXRFs20zmKslIpEo+dOHwbWwFDO6+TrFBPyd8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  checkInputs = [ roslaunch roslint ];
  propagatedBuildInputs = [ dynamic-reconfigure geometry-msgs nav-msgs roscpp tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Streaming of Nokov mocap data to tf
    <p>
    This package contains a node that translates motion capture data from an
    nokov rig to tf transforms, poses and 2D poses.
    </p>'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
