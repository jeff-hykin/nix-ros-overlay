
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, nav-msgs, pr2-msgs, python3Packages, rospy, std-msgs, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-wifi-ddwrt";
  version = "0.2.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "wifi_ddwrt-release";
    rev = "c9575c8abc979e5af6803ad5764fa20310329efd";
    owner = "ros-gbp";
    sha256 = "sha256-1N3MARRADUBUnj9lkJoMhxLMbc/qXOH5TbNni9c3mFk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation ];
  propagatedBuildInputs = [ geometry-msgs message-runtime nav-msgs pr2-msgs python3Packages.mechanize rospy std-msgs tf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Access to the DD-WRT wifi'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
