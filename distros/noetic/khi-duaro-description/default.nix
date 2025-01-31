
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, roslaunch }:
buildRosPackage {
  pname = "ros-noetic-khi-duaro-description";
  version = "1.3.0-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "khi_robot-release";
    rev = "8fc40124d0fa7273da8d27b05b48cb76719713ee";
    owner = "Kawasaki-Robotics";
    sha256 = "sha256-SI44DxF0iR2QLWMYIP3exN6t/BVbOcd0wgTEMFM4n0k=";
  };

  buildType = "catkin";
  buildInputs = [ catkin roslaunch ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The khi_duaro_description package'';
    license = with lib.licenses; [ bsdOriginal "KHI-CAD-license-mesh-data,-see-readme-" ];
  };
}
