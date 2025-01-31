
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, geometry-msgs, image-geometry, image-transport, image-view, message-filters, message-generation, message-runtime, pcl-ros, python3Packages, roscpp, rostest, sensor-msgs, std-msgs, std-srvs, tf }:
buildRosPackage {
  pname = "ros-noetic-image-view2";
  version = "2.2.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_common-release";
    rev = "c7038ff4e917476d9f44f5521cf6d6a83f6e7c41";
    owner = "tork-a";
    sha256 = "sha256-coBA7xwyBUpFLf9FYkCRDdSMtbsT3Mwf2h/x6cjrFK8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation rostest ];
  checkInputs = [ python3Packages.numpy python3Packages.scipy ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs image-geometry image-transport image-view message-filters message-runtime pcl-ros roscpp sensor-msgs std-msgs std-srvs tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A simple viewer for ROS image topics with draw-on features'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
