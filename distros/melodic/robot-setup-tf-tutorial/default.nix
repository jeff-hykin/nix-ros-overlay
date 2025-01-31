
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, geometry-msgs, roscpp, tf }:
buildRosPackage {
  pname = "ros-melodic-robot-setup-tf-tutorial";
  version = "0.2.4-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "navigation_tutorials-release";
    rev = "5ba54499cbc17bff6f33ca937d436806396f66f5";
    owner = "ros-gbp";
    sha256 = "sha256-QaYglsQNDJYMXThFFbPway7lRq+RkQ/nWG18mWbGhSo=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  propagatedBuildInputs = [ geometry-msgs roscpp tf ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The robot_setup_tf_tutorial package'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
