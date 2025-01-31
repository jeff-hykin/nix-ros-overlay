
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, wge100-camera, wge100-camera-firmware }:
buildRosPackage {
  pname = "ros-noetic-wge100-driver";
  version = "1.8.5-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "wge100_driver-release";
    rev = "f016cf4e0e17423c8c04f7e5322943e27cc4fbbd";
    owner = "ros-drivers-gbp";
    sha256 = "sha256-5jCJ35Sa4EqUG7sjS99rsr7MoRwXYB6rFXDpzGefuYk=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ wge100-camera wge100-camera-firmware ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This stack contains the ROS driver and firmware for the WGE100 camera used on the PR2 robot.'';
    license = with lib.licenses; [ "BSD-&-GPL-because-of-list.h-&-other-files-released-under-BSD-&-GPL" ];
  };
}
