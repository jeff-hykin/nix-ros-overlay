
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, dynamic-reconfigure, marker-msgs, mrpt-msgs, mrpt-msgs-bridge, mrpt2, nav-msgs, rosbag, roscpp, sensor-msgs, tf2, tf2-geometry-msgs, tf2-ros }:
buildRosPackage {
  pname = "ros-melodic-mrpt-rawlog";
  version = "1.0.3-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "mrpt_navigation-release";
    rev = "c64d024abbc631a5003c878b61481b8cae33261c";
    owner = "mrpt-ros-pkg-release";
    sha256 = "sha256-uuhErd4GPirrV6bwgHc6quoRNFP7wFAi7NEsaV9JfNw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ dynamic-reconfigure marker-msgs mrpt-msgs mrpt-msgs-bridge mrpt2 nav-msgs rosbag roscpp sensor-msgs tf2 tf2-geometry-msgs tf2-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides nodes to record and play MRPT rawlogs.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
