
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, aruco, aruco-msgs, catkin, cv-bridge, dynamic-reconfigure, geometry-msgs, image-transport, roscpp, sensor-msgs, tf, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-aruco-ros";
  version = "2.2.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "aruco_ros-release";
    rev = "19d3887b87b9eed1d1f12deb5a38578c1f5eb848";
    owner = "pal-gbp";
    sha256 = "sha256-bV9ZrCzUaMTGCgl5F3x0V1HCokpB73m9lbS7paN6C6A=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ aruco aruco-msgs cv-bridge dynamic-reconfigure geometry-msgs image-transport roscpp sensor-msgs tf visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The ARUCO Library has been developed by the Ava group of the Univeristy of Cordoba(Spain).
    It provides real-time marker based 3D pose estimation using AR markers.'';
    license = with lib.licenses; [ mit ];
  };
}
