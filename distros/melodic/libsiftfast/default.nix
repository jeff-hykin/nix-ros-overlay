
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, boost, catkin, mk, pythonPackages, rosboost-cfg, roslib, rospack, subversion }:
buildRosPackage {
  pname = "ros-melodic-libsiftfast";
  version = "2.1.24-r2";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "jsk_3rdparty-release";
    rev = "679679ca442088efd1b53e481945d1ef9d11ad24";
    owner = "tork-a";
    sha256 = "sha256-8z8kZbYPLBKRGE2Q0MYfpJUXqYviVqM3rBUXqPY3boU=";
  };

  buildType = "catkin";
  buildInputs = [ catkin mk rosboost-cfg roslib rospack subversion ];
  propagatedBuildInputs = [ boost pythonPackages.numpy ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Library to compute SIFT features'';
    license = with lib.licenses; [ "LGPL" ];
  };
}
