
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake-modules, eigen }:
buildRosPackage {
  pname = "ros-melodic-hebi-cpp-api";
  version = "3.2.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "hebi_cpp_api_ros-release";
    rev = "405eeec2c2c8ade67c9bb8169f0ceacd17711a4f";
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
