
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-msgs, dynamic-reconfigure, fkie-master-discovery, fkie-master-sync, fkie-multimaster-msgs, fkie-node-manager-daemon, python-qt-binding, python3Packages, rosgraph, roslaunch, roslib, rosmsg, rospy, rosservice, rqt-gui, rqt-reconfigure, screen, xterm }:
buildRosPackage {
  pname = "ros-noetic-fkie-node-manager";
  version = "1.3.2-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "multimaster_fkie-release";
    rev = "4ecf8b02cf96c3cc89a7813157c77a8944a77f4f";
    owner = "fkie-release";
    sha256 = "sha256-ldCzh6WYqXR/q1wO+FU23El+NMi37WJVMBG/RccBAgU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ diagnostic-msgs dynamic-reconfigure fkie-master-discovery fkie-master-sync fkie-multimaster-msgs fkie-node-manager-daemon python-qt-binding python3Packages.docutils python3Packages.paramiko python3Packages.pycryptodomex python3Packages.pyqt5_with_qtwebkit python3Packages.ruamel_yaml rosgraph roslaunch roslib rosmsg rospy rosservice rqt-gui rqt-reconfigure screen xterm ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Graphical interface, written in PySide, to manage the running and 
     configured ROS nodes on different hosts. For discovering 
     the running ROS master master_discovery node will be used.'';
    license = with lib.licenses; [ "BSD-&-some-icons-are-licensed-under-LGPL-or-CC-BY-NC-3.0" ];
  };
}
