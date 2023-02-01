
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, eigen }:
buildRosPackage {
  pname = "ros-noetic-hebi-cpp-api";
  version = "3.2.0-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hebi_cpp_api_ros-release";
    rev = "abea941730ec4b2981736cb90dee5ada3e09db57";
    owner = "HebiRobotics";
    sha256 = "sha256-QSAEabtAQlkrQTpDECGciMGUtGZzgFgFzK5D+IHf/O8=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules eigen ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A ROS package providing access to the HEBI C++ API.'';
    license = with lib.licenses; [ "HEBI-C-Software-License-https-www.hebirobotics.com-softwarelicense-" ];
  };
}
