
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, rospy }:
buildRosPackage {
  pname = "ros-melodic-teleop-legged-robots";
  version = "1.1.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "teleop_legged_robots-release";
    rev = "ad48fd3e216843253b36bfaea4b6c76a51915976";
    owner = "SoftServeSAG";
    sha256 = "sha256-TTdOolQrx0eIplFQXi3BHPo56lOYXCVYFKWuThYggJY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs rospy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Generic keyboard teleop for legged robots.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
