
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-noetic-rosbag-migration-rule";
  version = "1.0.1-r1";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag_migration_rule-release";
    rev = "363f61b4cd8caa078b11e753a34174e60d83e398";
    owner = "ros-gbp";
    sha256 = "sha256-31yh48R6F2uIzYu6RmEGfmuFU/pt/dIFGTUBlfd7vbA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This empty package allows to export rosbag migration rule files without depending on rosbag.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
