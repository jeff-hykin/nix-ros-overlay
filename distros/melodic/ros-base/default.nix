
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, bond-core, catkin, dynamic-reconfigure, nodelet-core, ros-core }:
buildRosPackage {
  pname = "ros-melodic-ros-base";
  version = "1.4.1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "metapackages-release";
    rev = "3074034e9ceaad798a9f9e5252a9f131bf4d760a";
    owner = "ros-gbp";
    sha256 = "sha256-Rx6p3zz1LS88OnLuFpdogyVIaEAfN+6R6V4Q9oAGqiM=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ actionlib bond-core dynamic-reconfigure nodelet-core ros-core ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A metapackage which extends ros_core and includes other basic non-robot tools like actionlib, dynamic reconfigure, nodelets, and pluginlib.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
