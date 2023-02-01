
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, cmake, eigen, libccd, octomap }:
buildRosPackage {
  pname = "ros-noetic-fcl";
  version = "0.6.1-r3";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "fcl-release";
    rev = "ad12bd823d24a1469b08f25ac50eacb6a51a8cc3";
    owner = "ros-gbp";
    sha256 = "sha256-WIcfbptmdDN7PqrUWVJkMrGrWnFEr582XlztZtcMKD8=";
  };

  buildType = "cmake";
  buildInputs = [ cmake ];
  propagatedBuildInputs = [ catkin eigen libccd octomap ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''FCL: the Flexible Collision Library'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
