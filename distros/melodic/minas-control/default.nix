
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, controller-manager, diagnostic-updater, ethercat-manager, hardware-interface, joint-limits-interface, realtime-tools, roslaunch, rostest, sensor-msgs, soem, tinyxml, trajectory-msgs, transmission-interface }:
buildRosPackage {
  pname = "ros-melodic-minas-control";
  version = "1.0.10-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "minas-release";
    rev = "d4082565e9e4fd2f94897b23db0282dba7efaf7c";
    owner = "tork-a";
    sha256 = "sha256-s/6MFMllPJZySZM6LZn7hxnM7cD3H/jZ1yLbmLos+Zc=";
  };

  buildType = "catkin";
  buildInputs = [ catkin soem ];
  checkInputs = [ roslaunch rostest ];
  propagatedBuildInputs = [ controller-manager diagnostic-updater ethercat-manager hardware-interface joint-limits-interface realtime-tools sensor-msgs tinyxml trajectory-msgs transmission-interface ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package contains ros_control based robot controller for PANASONIC MINAS EtherCAT Motor Driver Control System'';
    license = with lib.licenses; [ "GPL-2.0-only" bsdOriginal ];
  };
}
