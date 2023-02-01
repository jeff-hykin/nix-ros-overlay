
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, image-transport, pkg-config, python3Packages, roscpp, rospy, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-jderobot-carviz";
  version = "0.1.6-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "carViz-release";
    rev = "8a255293f3806fb0ce8c324d983e1e0559e56951";
    owner = "JdeRobot";
    sha256 = "sha256-hOuvnfPnXmZ52P7Ehs8KxT5ihX0yFFB1JD9zak97BKs=";
  };

  buildType = "catkin";
  buildInputs = [ pkg-config ];
  propagatedBuildInputs = [ cv-bridge image-transport python3Packages.pyyaml roscpp rospy sensor-msgs std-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''carViz package'';
    license = with lib.licenses; [ gpl3 ];
  };
}
