
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, cmake-modules, gtest, pkg-config, python3, python3Packages, ros-environment, tinyxml-2 }:
buildRosPackage {
  pname = "ros-noetic-rospack";
  version = "2.6.2-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rospack-release";
    rev = "3e2c78c3fc0953cf0f6b8b62473d9a08a3007f7c";
    owner = "ros-gbp";
    sha256 = "sha256-Lb/4oAU4T1B11g/PWlp/Mr/+LlheL7tUDKEMOuKjnAY=";
  };

  buildType = "catkin";
  buildInputs = [ catkin cmake-modules gtest ];
  checkInputs = [ python3Packages.coverage ];
  propagatedBuildInputs = [ boost pkg-config python3 python3Packages.catkin-pkg python3Packages.rosdep ros-environment tinyxml-2 ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''ROS Package Tool'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
