
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, message-generation, message-runtime, pr2-msgs, rospy, rostest, std-msgs, visualization-msgs }:
buildRosPackage {
  pname = "ros-noetic-fingertip-pressure";
  version = "1.9.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pr2_ethercat_drivers-release";
    rev = "8199b4fee4dff01d84c27fc815389e546e97f10b";
    owner = "pr2-gbp";
    sha256 = "sha256-/8O7K/ErNQM3nz0bY2oDzmTd/qLk/zp2j0V6RpVF6mw=";
  };

  buildType = "catkin";
  buildInputs = [ catkin message-generation rostest ];
  propagatedBuildInputs = [ geometry-msgs message-runtime pr2-msgs rospy std-msgs visualization-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This package provides access to the PR2 fingertip pressure sensors. This information includes:'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
