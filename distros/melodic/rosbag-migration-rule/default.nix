
# Copyright 2023 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin }:
buildRosPackage {
  pname = "ros-melodic-rosbag-migration-rule";
  version = "1.0.0";

  src =  (builtins.import (builtins.fetchTarball ({ url = "https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz"; })) ({})).fetchFromGitHub {
    repo = "rosbag_migration_rule-release";
    rev = "724c171cac784b4a313f0330b70b60cfaa5cbd3a";
    owner = "ros-gbp";
    sha256 = "sha256-dk1tz86FGMa1XwsdqrDMvURDEifzY9dK7Kanr6VZTXA=";
  };

  buildType = "catkin";
  buildInputs = [ catkin ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''This empty package allows to export rosbag migration rule files without depending on rosbag.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}
