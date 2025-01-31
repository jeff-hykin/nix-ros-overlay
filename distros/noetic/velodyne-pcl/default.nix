
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, pcl-ros, roslint }:
buildRosPackage {
  pname = "ros-noetic-velodyne-pcl";
  version = "1.7.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "velodyne-release";
    rev = "c8df29fd230b2991fa906fc458eedb8c98f132d5";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-svqh78z1EDXZzkkTOTOOKC8/+oANCO7Ue7eSgpGurQQ=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslint ];
  propagatedBuildInputs = [ pcl-ros ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The velodyne_pcl package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
