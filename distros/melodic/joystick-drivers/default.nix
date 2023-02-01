
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, joy, ps3joy, spacenav-node, wiimote }:
buildRosPackage {
  pname = "ros-melodic-joystick-drivers";
  version = "1.14.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "joystick_drivers-release";
    rev = "adb4d07ab8466427e2ac292ddb5c8d6c7a144d82";
    owner = "ros-gbp";
    sha256 = "sha256-FYOvseNSUJ1GZi5EahtTT6k3UDanI3kcPx52ldLqJnU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ joy ps3joy spacenav-node wiimote ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This metapackage depends on packages for interfacing common
    joysticks and human input devices with ROS.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
