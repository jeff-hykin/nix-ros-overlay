
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ainstein-radar-filters, ainstein-radar-msgs, catkin, cv-bridge, image-geometry, image-transport, pcl-ros, roscpp, sensor-msgs, std-msgs, vision-msgs }:
buildRosPackage {
  pname = "ros-melodic-ainstein-radar-tools";
  version = "2.0.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "ainstein_radar-release";
    rev = "1f03822768820f4efe77f6336fb79536cad718d7";
    owner = "AinsteinAI";
    sha256 = "sha256-wOdOFkLTZt5jkSyXwNS6ZpxajpsJmBx5347rcae7LN8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ ainstein-radar-filters ainstein-radar-msgs cv-bridge image-geometry image-transport pcl-ros roscpp sensor-msgs std-msgs vision-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Tools for monitoring and validating radar data.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
