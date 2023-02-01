
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, urdf, xacro }:
buildRosPackage {
  pname = "ros-melodic-pheeno-ros-description";
  version = "0.1.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "pheeno_ros_description-release";
    rev = "fe521b758441ad7d251ea762c77d1f1ee48bf2ba";
    owner = "acslaboratory";
    sha256 = "sha256-q/taM6MhmN+qjSaOkuSPVdTsk8vkX+qCHk00R49V470=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ urdf xacro ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pheeno_ros_description package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
