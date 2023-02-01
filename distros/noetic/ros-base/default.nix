
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, actionlib, bond-core, catkin, dynamic-reconfigure, nodelet-core, ros-core }:
buildRosPackage {
  pname = "ros-noetic-ros-base";
  version = "1.5.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "metapackages-release";
    rev = "f79d26581a8dfc86c59a738d64e18d86030949e5";
    owner = "ros-gbp";
    sha256 = "sha256-HCTiEW7+Xx7DxDBd2ZfzBj4hQfT4QRV/HhvmKH1m8YQ=";
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
