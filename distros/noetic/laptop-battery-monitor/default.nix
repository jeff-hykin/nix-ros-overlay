
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, diagnostic-msgs, rospy, sensor-msgs }:
buildRosPackage {
  pname = "ros-noetic-laptop-battery-monitor";
  version = "0.2.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "linux_peripheral_interfaces-release";
    rev = "46c4727c5a00d78e82fcba1352253daed16830c4";
    owner = "ros-gbp";
    sha256 = "sha256-J+Y6ECaOzF6cjAacS2upk7NAYS5fltX2SYyXPxaqrUw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ diagnostic-msgs rospy sensor-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Simple script to check battery status'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
