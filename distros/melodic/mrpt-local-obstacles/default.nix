
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, mrpt2, roscpp, sensor-msgs, tf2, tf2-geometry-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-melodic-mrpt-local-obstacles";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrpt_navigation-release";
    rev = "f714b44fe6c86e84c1508a53eca515de047d26cb";
    owner = "mrpt-ros-pkg-release";
    sha256 = "sha256-+XelWhmpNWGN2VPwsYxvnDqE5n0evaT4N/G8w9QpAgk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure mrpt2 roscpp sensor-msgs tf2 tf2-geometry-msgs visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Maintains a local obstacle map (point cloud,
   voxels or occupancy grid) from recent sensor readings within a
   configurable time window.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
