
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, kobuki-dock-drive, kobuki-driver, kobuki-ftdi }:
buildRosPackage {
  pname = "ros-noetic-kobuki-core";
  version = "0.7.12-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "kobuki_core-release";
    rev = "94ae5e4724119e00a963608f2d43713896109471";
    owner = "yujinrobot-release";
    sha256 = "sha256-FJ6sT/26Sul/nwI17KnFDkFKz7eoZIwu1pA/RbbhmbE=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ kobuki-dock-drive kobuki-driver kobuki-ftdi ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Non-ROS software for Kobuki, Yujin Robot's mobile research base.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
