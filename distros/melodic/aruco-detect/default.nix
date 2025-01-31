
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cv-bridge, dynamic-reconfigure, fiducial-msgs, image-transport, pythonPackages, roscpp, sensor-msgs, tf2, tf2-geometry-msgs, tf2-ros, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-aruco-detect";
  version = "0.11.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fiducials-release";
    rev = "b56a390e9969381d0bc2723b83b0a07176195a36";
    owner = "UbiquityRobotics-release";
    sha256 = "sha256-J+hYNgtw+PNrJbmHuBJRT+bictsIyCSEHIh38y1Yu+A=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ cv-bridge dynamic-reconfigure fiducial-msgs image-transport pythonPackages.cairosvg pythonPackages.joblib roscpp sensor-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Fiducial detection based on the aruco library'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
