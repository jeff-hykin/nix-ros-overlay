
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, rqt-gui, rqt-gui-cpp, rqt-gui-py }:
buildRosPackage {
  pname = "ros-noetic-rqt";
  version = "0.5.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rqt-release";
    rev = "ed2fc911c78d7ed4997a84be9ef6414ebc9bcc8a";
    owner = "ros-gbp";
    sha256 = "sha256-Upv5EmuQw6GsKPsr7camVEb/mzP1vbLGQnYCULJTNu4=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-cpp rqt-gui-py ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''rqt is a Qt-based framework for GUI development for ROS. It consists of three parts/metapackages<br/>
    <ul>
     <li>rqt (you're here)</li>
     <li><a href="http://ros.org/wiki/rqt_common_plugins">rqt_common_plugins</a> - ROS backend tools suite that can be used on/off of robot runtime.</li>
     <li><a href="http://ros.org/wiki/rqt_robot_plugins">rqt_robot_plugins</a> - Tools for interacting with robots during their runtime.</li>
    </ul>
   rqt metapackage provides a widget <a href="http://ros.org/wiki/rqt_gui">rqt_gui</a> that enables multiple `rqt` widgets to be docked in a single window.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
