
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, cv-bridge, freeglut, geometry-msgs, glew, image-transport, launch-xml, libyamlcpp, mapviz-interfaces, marti-common-msgs, pkg-config, pluginlib, qt5, rclcpp, rqt-gui, rqt-gui-cpp, std-srvs, swri-math-util, swri-transform-util, tf2, tf2-geometry-msgs, tf2-ros, xorg }:
buildRosPackage {
  pname = "ros-galactic-mapviz";
  version = "2.2.0-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mapviz-release";
    rev = "e65df67bb9c006a4ce92ca120796741df10ad90b";
    owner = "swri-robotics-gbp";
    sha256 = "sha256-IJhlcVytsrYM4kb7uCFThqtV6b6qcd28FcAriVzBUKE=";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake pkg-config ];
  propagatedBuildInputs = [ cv-bridge freeglut geometry-msgs glew image-transport launch-xml libyamlcpp mapviz-interfaces marti-common-msgs pluginlib qt5.qtbase rclcpp rqt-gui rqt-gui-cpp std-srvs swri-math-util swri-transform-util tf2 tf2-geometry-msgs tf2-ros xorg.libXi xorg.libXmu ];
  nativeBuildInputs = [ ament-cmake pkg-config qt5.qtbase ];

  meta = {
    description = ''mapviz'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
