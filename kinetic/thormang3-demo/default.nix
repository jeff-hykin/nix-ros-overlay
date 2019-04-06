
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, qt4, robotis-controller-msgs, thormang3-manipulation-module-msgs, geometry-msgs, thormang3-navigation, boost, eigen-conversions, roslib, thormang3-feet-ft-module-msgs, thormang3-action-script-player, catkin, thormang3-foot-step-generator, qt-build, std-msgs, roscpp, visualization-msgs, thormang3-walking-module-msgs, cmake-modules, libyamlcpp, sensor-msgs, interactive-markers, eigen, humanoid-nav-msgs }:
buildRosPackage {
  pname = "ros-kinetic-thormang3-demo";
  version = "0.3.0";

  src = fetchurl {
    url = https://github.com/ROBOTIS-GIT-release/ROBOTIS-THORMANG-OPC-release/archive/release/kinetic/thormang3_demo/0.3.0-0.tar.gz;
    sha256 = "9f7f8a620e49890b715b1136f9a3b586a0cccc098ad088e14db56bb9aca75ef1";
  };

  propagatedBuildInputs = [ thormang3-feet-ft-module-msgs qt4 thormang3-action-script-player thormang3-foot-step-generator qt-build std-msgs roscpp robotis-controller-msgs thormang3-manipulation-module-msgs thormang3-walking-module-msgs visualization-msgs thormang3-navigation geometry-msgs cmake-modules boost libyamlcpp sensor-msgs interactive-markers eigen eigen-conversions roslib humanoid-nav-msgs ];
  nativeBuildInputs = [ thormang3-feet-ft-module-msgs qt4 catkin thormang3-foot-step-generator qt-build std-msgs roscpp robotis-controller-msgs thormang3-manipulation-module-msgs thormang3-walking-module-msgs visualization-msgs geometry-msgs cmake-modules boost libyamlcpp sensor-msgs interactive-markers eigen eigen-conversions roslib humanoid-nav-msgs ];

  meta = {
    description = ''A GUI program for controlling a THORMANG3.
    Initial posture, walking, manipulation, head control are available with this package.'';
    #license = lib.licenses.Apache 2.0;
  };
}