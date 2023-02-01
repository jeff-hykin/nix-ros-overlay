
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, cv-bridge, diagnostic-msgs, image-transport, libyamlcpp, pkg-config, python3Packages, roscpp, rospy, sensor-msgs, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-jderobot-camviz";
  version = "0.1.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "CamViz-release";
    rev = "7feee6534a2986497a78a9cc68da106150ed364a";
    owner = "JdeRobot";
    sha256 = "sha256-pIdvtnI134JcoYTbGcqu+WqILV8oUI3EFsXQr7odmy0=";
  };

  buildType = "catkin";
  buildInputs = [ pkg-config ];
  checkInputs = [ diagnostic-msgs ];
  propagatedBuildInputs = [ cv-bridge image-transport libyamlcpp python3Packages.pyyaml roscpp rospy sensor-msgs std-msgs ];
  nativeBuildInputs = [ python3Packages.catkin-pkg ];

  meta = {
    description = ''camViz package'';
    license = with lib.licenses; [ gpl3 ];
  };
}
